import os
import subprocess

global env
env = dict()


def source_config(file):
    global env
    env = source(file)


def source(file):

    command = ['bash', '-c', 'source %s ; env' % file]

    proc = subprocess.Popen(command, stdout=subprocess.PIPE)

    env = dict()

    for line in proc.stdout:
        (key, _, value) = line.decode('utf-8').partition("=")
        env[key] = value.strip()

    proc.communicate()

    return env
