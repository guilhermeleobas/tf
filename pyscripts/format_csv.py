import pandas as pd
import sys

def format_run_cmd(cmd):
    d = cmd.split(' ')[1].split('/')
    if d[-2] == 'Benchs':
        return d[-1]
    return d[-2] + '/' + d[-1]

def main(arg):
    df = pd.read_csv(arg, sep='\t')
    
    df.Command = df.Command.apply(format_run_cmd)
    df = df.drop(['Seq', 'Starttime', 'Exitval', 'Signal', 'Host', 'Send', 'Receive'], axis=1)
    
    df.reset_index(drop=True).set_index('Command').to_csv(sys.stdout)

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print ('Usage: python3 format_csv.py file')
    main(sys.argv[1])
    
