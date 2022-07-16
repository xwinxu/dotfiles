"""Check if the directories excluded are valid.
Note: rsync interprets a SOURCE directory with no trailing slash as copy this directory, and a directory/ with a trailing slash as copy the contents of this directory
e.g. rsync -av --exclude='^.*pycache.*$|^.*vscode.*$|^.*git.*$|^.*pyc.*$' ddpm/ winnie-brain-research/
"""
import re

def check_regex(regex_str, test_dirs):
  r = re.compile(regex_str)
  print(f'checking regex {regex_str}...')
  for d in test_dirs:
     if r.match(d):
        print(f'Regex matches: {d}')
     else:
        print(f'Regex does not match: {d}')
  print(f'done checking {test_dirs}')
  
if __name__ == '__main__':
  regex_str = '^.*__pycache__*$|^.*vscode*$|^.&git*$'
  dirs = ['__pycache__', '.vscode', '.git', '.gitignore']
  check_regex(regex_str, dirs)
