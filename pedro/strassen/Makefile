SOURCEDIR = .

include ../../Makefile.common

TEST_INPUT = 512
SMALL_INPUT = 512
MEDIUM_INPUT = 2048
BIG_INPUT = 8192

run: compile
	@echo "====RUNNING BOTS/STRASSEN===="
	$(MAKE) -i run-parallel;
	$(MAKE) -i run-serial;