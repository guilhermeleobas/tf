SOURCEDIR = .

include ../../Makefile.common

TEST_INPUT = 8388608
SMALL_INPUT = 33554432
MEDIUM_INPUT = 134217728
BIG_INPUT = 536870912

run: compile
	@echo "====RUNNING BOTS/SORT===="
	$(MAKE) -i run-parallel;
	$(MAKE) -i run-serial;