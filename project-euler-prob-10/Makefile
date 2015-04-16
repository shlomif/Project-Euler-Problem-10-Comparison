TARGETS = haskell_mine haskell_zeroth c_mine c_mine_micro_opt c_mine_half \
		  c_opti_mine c_opti_mine_micro_opt c_opti_mine_half

C_OPTIMIZED_OPTS = -march=native -fomit-frame-pointer -fPIC -fvisibility=hidden -O2

HS_OPTS = -O2

all: $(TARGETS)

haskell_mine: 10.hs
	ghc $(HS_OPTS) -o $@ $<

haskell_zeroth: 10-zerothorder.hs
	ghc $(HS_OPTS) -o $@ $<

c_mine: 10.c
	gcc -O2 -o $@ -Wall $<

c_mine_micro_opt: 10_micro_opt.c
	gcc -O2 -o $@ -Wall $<

c_mine_half: 10_half.c
	gcc -O2 -o $@ -Wall $<

c_opti_mine: 10.c
	gcc $(C_OPTIMIZED_OPTS) -o $@ -Wall $<

c_opti_mine_micro_opt: 10_micro_opt.c
	gcc $(C_OPTIMIZED_OPTS) -o $@ -Wall $<

c_opti_mine_half: 10_half.c
	gcc $(C_OPTIMIZED_OPTS) -o $@ -Wall $<

mystrip:
	strip $(TARGETS)

clean:
	rm -f $(TARGETS)

bench:
	perl benchmark.pl 2>&1 | tee bench_results.txt
