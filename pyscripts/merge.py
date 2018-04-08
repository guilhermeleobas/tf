import sys
import os
import pandas as pd

def get_csv(path):
    try:
        return pd.read_csv(path) \
                .rename(columns=lambda c : c.strip())
    except:
        return None
    
def check(dfs, df, filepath):
    if dfs == []:
        return True
    # check if the header of df is equals to all headers in dfs
    (first, p) = dfs[0]
    if len(first.columns) != len(df.columns):
        print("file {fp} have more/less columns when compared to {p}".format(fp=filepath, p=p), file=sys.stderr)
        return False
    
    for (i, _) in enumerate(df.columns):
        if df.columns[i] != first.columns[i]:
            print("file {fp} have different columns when compared to {p}".format(fp=filepath, p=p), file=sys.stderr)
            return False
    return True

def merge(args):
    
    dfs = []
    
    for arg in args:
        if os.path.isdir(arg):
            for csv_file in os.listdir(arg):
                p = os.path.join(arg, csv_file)
                if os.path.isfile(p) == False:
                    continue
                if os.path.splitext(p)[1] != '.csv':
                    continue
                df = get_csv(p)
                if df is not None:
                    check(dfs, df, p)
                    dfs.append( (df, p) )
        elif os.path.isfile(arg):
            df = get_csv(arg)
            if df is not None:
                check(dfs, df, arg)
                dfs.append( (df, arg) )
        else:
            print ("Error processing {}".format(arg))
    
    dfs = list(map(lambda x: x[0], dfs))
    return pd.concat(dfs).reset_index(drop=True)
    
    
if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('You must specify at least one folder or file')
        print('  python merge.py ../data/mediabench_tables ../data/cpu2006_tables')
        sys.exit(1)
    merge(sys.argv[1:]).to_csv(sys.stdout)
