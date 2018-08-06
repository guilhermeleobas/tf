#!/usr/bin/env python3

import sys
from src import source as s
from src import benchmark as b


def parse_args():

    import argparse
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest='command')

    parser.add_argument('-c', '--config', help='Config File', action='store',
                        default='config.sh')

    # list benchmarks
    list = subparsers.add_parser('list', help='List Benchmarks')
    list.add_argument('-o', '--only', action='store', type=str)

    # compile args
    compile = subparsers.add_parser('compile', help='Compile benchmarks', add_help=False)
    compile.add_argument('-p', '--parallel', action='store_true',
                         help='Enable parallel build')
    compile.add_argument('-o', '--only', action='store', type=str,
                         help='Compile only a single suite')
    
    # instrument
    instrument = subparsers.add_parser('instrument', help='Compile benchmarks', parents=[compile])

    # exec args
    exec = subparsers.add_parser('exec', help='Run benchmarks', add_help=False)
    exec.add_argument('-j', '--jobs', action='store', default='1', type=str,
                      help='Number of processes used')
    exec.add_argument('-o', '--only', action='store', type=str,
                      help='Run only a single suite')
    exec.add_argument(
        '-t', '--timeout', action='store', type=str, default='8m',
        help='Time limit for each benchmark. Default is 8 minutes')
    exec.add_argument('-d', '--debug', action='store_true',
                      help='Redirect benchmark output to stdout')
    exec.add_argument('-i', '--instrument', action='store_true', default='store_false')

    # pin args
    pin = subparsers.add_parser('pin', help='Run benchmarks with Intel Pin', parents=[exec])
    pin.add_argument('--pin_path', action='store', default='', type=str, required=True,
                     help='Pin root dir')
    pin.add_argument('--pin_lib', action='store', default='', type=str, required=True,
                     help='The place where one keeps the Pin lib implemented'
                    )  # For building purposes
    pin.add_argument('--pin_tool', action='store', default='', type=str, required=True,
                     help='The PinTool used')

    # perf args
    perf = subparsers.add_parser('perf', help='Run benchmarks with perf', parents=[exec])
    perf.add_argument('--perf_tool', action='store', default='', type=str,
                      help='The perf event')
    # perf.add_argument('--perf_type', action='store', default='u', type=str,
    #                   help='User space (u) or Kernel space (k)')

    # summary
    summary = subparsers.add_parser('summary',
                                    help='Present a small execution summary')

    ##
    p = parser.parse_args()

    return p

def process_args(p):

    s.source_config(p.config)
    
    cmd = ['list', 'compile', 'instrument', 'exec', 'pin', 'perf']

    # compile & instrument
    if p.command in ['compile', 'instrument']:
        s.env['only'] = p.only
        s.env['parallel'] = '1' if p.parallel else '0'
    # exec
    if p.command in ['exec', 'pin', 'perf']:
        s.env['only'] = p.only
        s.env['jobs'] = p.jobs
        s.env['timeout'] = p.timeout
        s.env['STDOUT'] = '/dev/stdout' if p.debug else '/dev/null' # debug!
        s.env['STDIN'] = '/dev/stdin'
    # pin
    if p.command == 'pin':
        s.env['PIN_PATH'] = p.pin_path
        s.env['PIN_LIB'] = p.pin_lib
        s.env['PIN_TOOL'] = p.pin_tool

    if p.command == 'perf':
        s.env['PERF_TOOL'] = p.perf_tool
        # s.env['PERF_TYPE']
    
    if p.command in cmd:
        suites = b.get_suites(p.only)
        for k, v in suites.items():
            fn = getattr(v, p.command)
            fn()
    elif p.command == 'summary':
        pass
    else:
        parser.print_help()
        sys.exit(1)


if __name__ == '__main__':
    p = parse_args()
    process_args(p)
