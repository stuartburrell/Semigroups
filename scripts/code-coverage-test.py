#!/usr/bin/env python
"""
"""

import argparse, tempfile, subprocess, sys, os, webbrowser

_PARSER = argparse.ArgumentParser(prog='code-coverage-test.py', usage='%(prog)s [options]')
_PARSER.add_argument('files', nargs='+', type=str,
                     help='the test files you want to check code coverage for'
                     + '(must be at least one)')
_PARSER.add_argument('--gap-root', nargs='?', type=str,
                     help='the gap root directory (default: ~/gap)',
                     default='~/gap/')
_ARGS = _PARSER.parse_args()

if not _ARGS.gap_root[-1] == '/':
    _ARGS.gap_root += '/'

_ARGS.gap_root = os.path.expanduser(_ARGS.gap_root)

if not (os.path.exists(_ARGS.gap_root) and os.path.isdir(_ARGS.gap_root)):
    sys.exit('\033[31mcode-coverage-test.py: error: can\'t find GAP root' +
             ' directory!\033[0m')

for f in _ARGS.files:
    if not (os.path.exists(f) and os.path.isfile(f)):
        sys.exit('\033[31mcode-coverage-test.py: error: ' + f + ' does not exist!\033[0m')

_DIR = tempfile.gettempdir()
print '\033[35musing temporary directory: ' + _DIR + '\033[0m'

_COMMANDS = 'echo "CoverageLineByLine(\\"' + _DIR + '/profile.gz\\");;'
_COMMANDS += 'LoadPackage(\\"semigroups\\", false);;'
for f in _ARGS.files:
    _COMMANDS += 'SEMIGROUPS.Test(\\"' + f + '\\", rec(silent := true));;'
_COMMANDS += '''UncoverageLineByLine();;
LoadPackage(\\"profiling\\", false);;
filesdir := Concatenation(SEMIGROUPS.PackageDir, \\"/gap/\\");;'''
_COMMANDS += 'outdir := \\"' + _DIR + '\\";;'
_COMMANDS += 'x := ReadLineByLineProfile(\\"' + _DIR + '/profile.gz\\");;'
_COMMANDS += 'OutputAnnotatedCodeCoverageFiles(x, filesdir, outdir);"'

pro1 = subprocess.Popen(_COMMANDS, stdout=subprocess.PIPE, shell=True)
_RUN_GAP = _ARGS.gap_root + 'bin/gap.sh -A -r -m 1g -T'

try:
    pro2 = subprocess.Popen(_RUN_GAP,
                            stdin=pro1.stdout,
                            shell=True)
    pro2.wait()
except KeyboardInterrupt:
    pro1.terminate()
    pro1.wait()
    pro2.terminate()
    pro2.wait()
    print '\033[31mKilled!\033[0m'
    sys.exit(1)
except (subprocess.CalledProcessError, IOError, OSError):
    sys.exit('\033[31mcode-coverage-test.py: error: something went wrong calling GAP!\033[0m')

try:
    webbrowser.open('file://' + _DIR + '/index.html', new=2)
except:
    print '\n\n\033[31mFailed to open file://' + _DIR + '/index.html\033[0m'
    sys.exit(1)

print '\n\n\033[32mSUCCESS!\033[0m'
sys.exit(0)
