"""Check if the directories excluded are valid"""
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
