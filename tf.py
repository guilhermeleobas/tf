#!/usr/bin/env python3

import sys
from src import source as s
from src import benchmark as b


def process_args():

    import argparse
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest='command')

    parser.add_argument('-c', '--config', help='Config File', action='store',
                        default='config.sh')

    # list benchmarks
    list = subparsers.add_parser('list', help='List Benchmarks')
    list.add_argument('-o', '--only', action='store', type=str)

    # compile args
    compile = subparsers.add_parser('compile', help='Compile benchmarks')
    compile.add_argument('-p', '--parallel', action='store_true',
                         help='Enable parallel build')
    compile.add_argument('-o', '--only', action='store', type=str,
                         help='Compile only a single suite')

    # run args
    exec = subparsers.add_parser('exec', help='Run benchmarks')
    exec.add_argument('-j', '--jobs', action='store', default=2, type=int,
                      help='Number of processes used')
    exec.add_argument('-o', '--only', action='store', type=str,
                      help='Run only a single suite')
    exec.add_argument(
        '-t', '--timeout', action='store', type=str, default='8m',
        help='Time limit for each benchmark. Default is 8 minutes')
    exec.add_argument('-d', '--debug', action='store_true',
                      help='Redirect benchmark output to stdout')

    # pin args
    pin = subparsers.add_parser('pin', help='Run benchmarks with Intel Pin')
    pin.add_argument('--pin_path', action='store', default='', type=str,
                     help='Pin root dir')
    pin.add_argument('--pin_lib', action='store', default='', type=str,
                     help='The place where one keeps the Pin lib implemented'
                    )  # For building purposes
    pin.add_argument('--pin_tool', action='store', default='', type=str,
                     help='The PinTool used')
    pin.add_argument('-o', '--only', action='store', type=str,
                     help='Run only a single suite')

    # perf args
    perf = subparsers.add_parser('perf', help='Run benchmarks with perf')
    perf.add_argument('--perf_tool', action='store', default='', type=str,
                      help='The perf event')
    perf.add_argument('--perf_type', action='store', default='u', type=str,
                      help='User space (u) or Kernel space (k)')
    perf.add_argument('-o', '--only', action='store', type=str,
                      help='Run only a single suite')

    # summary
    summary = subparsers.add_parser('summary',
                                    help='Present a small execution summary')

    ##
    p = parser.parse_args()

    s.source_config(p.config)

    if p.command == 'list':
        suites = b.get_suites(p.only)
        for k, v in suites.items():
            print(v)
    elif p.command == 'compile':
        suites = b.get_suites(p.only)
        for k, v in suites.items():
            v.compile_suite()
    elif p.command == 'run':
        pass
    elif p.command == 'pin':
        pass
    elif p.command == 'perf':
        pass
    elif p.command == 'summary':
        pass
    else:
        parser.print_help()
        sys.exit(1)


if __name__ == '__main__':
    process_args()
