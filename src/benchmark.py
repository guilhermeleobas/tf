import os
# from src.source import env
from src import source as s
from enum import Enum
from sultan.api import Sultan
from functools import reduce


class Type(Enum):
    SingleSource = 1
    MultiSource = 2


class Compile():

    def compile(self):
        env = {
            'COMPILER': 'clang',
            'BENCHMARK_PATH': self.path,
            # self.name: 1,
        }
        with Sultan.load(logging=False, env={**env, **s.env}) as cmd:
            print('COMPILING %s' % self.name)
            result = cmd.bash('src/compile.sh').run()
            print('\n'.join(result.stdout))
            print('\n'.join(result.stderr))
            print()


class Benchmark(Compile):

    def __init__(self, name=None, path=None):
        self._name = name
        self._path = path
        self._env = os.path.join(self._path, 'info.sh')

    def __repr__(self):
        return '  ' + self.name

    @property
    def name(self):
        return self._name

    @property
    def env(self):
        return self._env

    @property
    def path(self):
        return self._path


class Suite():

    def __init__(self, name=None, path=None, type=None):
        self._name = name
        self._path = os.path.join(s.env['TESTDIR'], name)
        self._type = type

        if self._type == Type.SingleSource:
            self._benchmarks = [Benchmark(name=self.name, path=self.path)]
        else:
            self._benchmarks = []
            for bench in os.listdir(self.path):
                if not bench.startswith('.') and os.path.isdir(
                        os.path.join(self.path, bench)):
                    self._benchmarks.append(
                        Benchmark(name=bench, path=os.path.join(
                            self.path, bench)))

    @property
    def benchmarks(self):
        return self._benchmarks

    @property
    def path(self):
        return self._path

    @property
    def name(self):
        return self._name

    def compile_suite(self):
        for bench in self.benchmarks:
            bench.compile()

    def __repr__(self):
        return self.name + '\n' + reduce(
            lambda acc, bench: acc + str(bench) + '\n', self.benchmarks, '')


def get_suites(selected=None):
    suites = {
        # Single benchmark
        'Fhourstones': Suite(name='Fhourstones', type=Type.SingleSource),
        'Fhourstones_31': Suite(name='Fhourstones_31', type=Type.SingleSource),
        'Linpack': Suite(name='Linpack', type=Type.SingleSource),
        'ASCI_Purple': Suite(name='ASCI_Purple', type=Type.SingleSource),
        'SciMark2-C': Suite(name='SciMark2-C', type=Type.SingleSource),
        'sim': Suite(name='sim', type=Type.SingleSource),
        'mafft': Suite(name='mafft', type=Type.SingleSource),
        'tramp3d-v4': Suite(name='tramp3d-v4', type=Type.SingleSource),
        'llubenchmark': Suite(name='llubenchmark', type=Type.SingleSource),
        'nbench': Suite(name='nbench', type=Type.SingleSource),
        'PAQ8p': Suite(name='PAQ8p', type=Type.SingleSource),
        # Multiple
        # 'ASC_Sequoia': Suite(name='ASC_Sequoia'),
        # 'BenchmarkGame': Suite(name='BenchmarkGame'),
        # 'BitBench': Suite(name='BitBench'),
        # 'CoyoteBench': Suite(name='CoyoteBench'),
        # 'Dhrystone': Suite(name='Dhrystone'),
        # 'DOE_ProxyApps_C': Suite(name='DOE_ProxyApps_C'),
        # 'McGill': Suite(name='McGill'),
        # 'MiBench': Suite(name='MiBench'),
        # 'Misc': Suite(name='Misc'),
        # 'Shootout': Suite(name='Shootout'),
        # 'Stanford': Suite(name='Stanford'),
        # 'Ptrdist': Suite(name='Ptrdist'),
        # 'Trimaran': Suite(name='Trimaran'),
        # 'TSVC': Suite(name='TSVC'),
        # 'NPB-serial': Suite(name='NPB-serial'),
        # 'VersaBench': Suite(name='VersaBench'),
        # 'FreeBench': Suite(name='FreeBench'),
        # 'MallocBench': Suite(name='MallocBench'),
        # 'McCat': Suite(name='McCat'),
        # 'Olden': Suite(name='Olden'),
        # 'Prolangs-C': Suite(name='Prolangs-C'),
        # # Special suite of benchmarks
        # 'mediabench': Suite(name='mediabench'),
        # 'cpu2006': Suite(name='cpu2006'),
    }

    if selected:
        return {selected: suites[selected]}
        # return {k: v for (k, v) in benchs.items() if k in selected}
    return suites
