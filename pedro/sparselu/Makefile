SOURCEDIR = .

include ../../Makefile.common

# [test]
# inputs=25x25

# [small]
# inputs=25x100

# [medium]
# inputs=75x100

# [large]
# inputs=100x100

TEST_INPUT = 25 25
SMALL_INPUT = 25 100
MEDIUM_INPUT = 75 100
BIG_INPUT =  100 100

run: compile
	@echo "====RUNNING BOTS/SPARSELU===="
	$(MAKE) -i run-parallel;
	$(MAKE) -i run-serial;