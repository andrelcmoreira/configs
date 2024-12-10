import os.path
from subprocess import PIPE
from os import readlink
from magic import from_file

from ranger.core.loader import CommandLoader
from ranger.api.commands import Command


class fzf_select(Command): # pylint: disable=invalid-name
    """
    :fzf_select

    Find a file using fzf.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzf
    """
    def execute(self):
        if self.quantifier:
            # match only directories
            command="find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -type d -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
        else:
            # match files and directories
            command="find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
        fzf = self.fm.execute_command(command, universal_newlines=True,
                                      stdout=PIPE)
        stdout, _ = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)


class extracthere(Command): # pylint: disable=invalid-name

    def execute(self):
        """ Extract copied files to current directory """
        copied_files = tuple(self.fm.copy_buffer)

        if not copied_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        one_file = copied_files[0]
        cwd = self.fm.thisdir
        original_path = cwd.path
        au_flags = ['-X', cwd.path]
        au_flags += self.line.split()[1:]
        au_flags += ['-e']

        self.fm.copy_buffer.clear()
        self.fm.cut_buffer = False
        if len(copied_files) == 1:
            descr = "extracting: " + os.path.basename(one_file.path)
        else:
            descr = "extracting files from: " + os.path.basename(one_file.dirname)
        obj = CommandLoader(args=['aunpack'] + au_flags \
                + [f.path for f in copied_files], descr=descr, read=True)

        obj.signal_bind('after', refresh)
        self.fm.loader.add(obj)


class compress(Command): # pylint: disable=invalid-name

    def execute(self):
        """ Compress marked files to current directory """
        cwd = self.fm.thisdir
        marked_files = cwd.get_selection()

        if not marked_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        original_path = cwd.path
        parts = self.line.split()
        au_flags = parts[1:]

        descr = "compressing files in: " + os.path.basename(parts[1])
        obj = CommandLoader(args=['apack'] + au_flags + \
                [os.path.relpath(f.path, cwd.path) for f in marked_files], descr=descr, read=True)

        obj.signal_bind('after', refresh)
        self.fm.loader.add(obj)

    def tab(self, tabnum):
        """ Complete with current folder name """

        extension = ['.zip', '.tar.gz', '.rar', '.7z']
        return ['compress ' + os.path.basename(self.fm.thisdir.path) + ext for ext in extension]


class up(Command): # pylint: disable=invalid-name

    def execute(self):
        if self.arg(1):
            scpcmd = ["scp", "-r"]
            scpcmd.extend([f.realpath for f in self.fm.thistab.get_selection()])
            scpcmd.append(self.arg(1))
            self.fm.execute_command(scpcmd)
            self.fm.notify("Uploaded!")


    def tab(self):
        try:
            import paramiko
        except ImportError:
            """paramiko not installed"""
            return

        try:
            with open(os.path.expanduser("~/.ssh/config")) as file:
                paraconf = paramiko.SSHConfig()
                paraconf.parse(file)
        except IOError:
            """cant open ssh config"""
            return

        hosts = paraconf.get_hostnames()
        # remove any wildcard host settings since they're not real servers
        hosts.discard("*")
        return (self.start(1) + host + ":" for host in hosts)


class yank_content(Command): # pylint: disable=invalid-name
    """
    :yank_content

    Copy the content of a given file to the clipboard. This command is specially
    useful for text and image files.
    """
    def execute(self):
        try:
            file_type = from_file(str(self.fm.thisfile), mime=True)

            if file_type == 'inode/symlink':
                src_file = readlink(str(self.fm.thisfile))
                file_type = from_file(src_file, mime=True)

            cmd = f'xclip -selection clipboard -i {self.fm.thisfile}'
            # if the file is not a text file, we must to explicitly specify its
            # type
            if 'text/' not in file_type:
                cmd += f' -t {file_type}'

            ret = self.fm.execute_command(cmd)
            if ret.returncode == 0:
                self.fm.notify(
                    f'content of "{self.fm.thisfile}" copied to clipboard!'
                )
            else:
                self.fm.notify(
                    f'fail to copy the content of "{self.fm.thisfile}"!',
                    bad=True
                )
        except PermissionError:
            self.fm.notify(
                f'no permission to view the content of "{self.fm.thisfile}"!'
            )
