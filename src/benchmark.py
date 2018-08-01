import os
from src.source import env
from enum import Enum


class Type(Enum):
    SingleSource = 1
    MultiSource = 2


class Benchmark():

    def __init__(self, name=None, path=None):
        self._name = name
        self._path = path
        self._info = os.path.join(self._path, 'info.sh')
        # self.env

    def __repr__(self):
        return self.name + ' ' + self._info

    @property
    def name(self):
        return self._name


class Suite():

    def __init__(self, name=None, path=None, type=None):
        self._name = name
        self._path = os.path.join(env['TESTDIR'], name)
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


benchs = {
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
    'ASC_Sequoia': Suite(name='ASC_Sequoia'),
    'BenchmarkGame': Suite(name='BenchmarkGame'),
    'BitBench': Suite(name='BitBench'),
    'CoyoteBench': Suite(name='CoyoteBench'),
    'Dhrystone': Suite(name='Dhrystone'),
    'DOE_ProxyApps_C': Suite(name='DOE_ProxyApps_C'),
    'McGill': Suite(name='McGill'),
    'MiBench': Suite(name='MiBench'),
    'Misc': Suite(name='Misc'),
    'Shootout': Suite(name='Shootout'),
    'Stanford': Suite(name='Stanford'),
    'Ptrdist': Suite(name='Ptrdist'),
    'Trimaran': Suite(name='Trimaran'),
    'TSVC': Suite(name='TSVC'),
    'NPB-serial': Suite(name='NPB-serial'),
    'VersaBench': Suite(name='VersaBench'),
    'FreeBench': Suite(name='FreeBench'),
    'MallocBench': Suite(name='MallocBench'),
    'McCat': Suite(name='McCat'),
    'Olden': Suite(name='Olden'),
    'Prolangs-C': Suite(name='Prolangs-C'),
    # Special suite of benchmarks
    'mediabench': Suite(name='mediabench'),
    'cpu2006': Suite(name='cpu2006'),
}
