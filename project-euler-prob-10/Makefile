TARGETS = haskell_mine haskell_zeroth c_mine c_mine_micro_opt c_mine_half

all: $(TARGETS)

haskell_mine: 10.hs
	ghc -o $@ $<

haskell_zeroth: 10-zerothorder.hs
	ghc -o $@ $<

c_mine: 10.c
	gcc -O2 -o $@ -Wall $<

c_mine_micro_opt: 10_micro_opt.c
	gcc -O2 -o $@ -Wall $<

c_mine_half: 10_half.c
	gcc -O2 -o $@ -Wall $<

mystrip:
	strip $(TARGETS)

clean:
	rm -f $(TARGETS)

bench:
	perl benchmark.pl 2>&1 | tee bench_results.txt
