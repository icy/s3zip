D_OUTPUT = ./output/

.PHONY: defaut
default: all

.PHONY: autogen
autogen: ../s3zip.rb input/*.tf.in
	@mkdir -pv "$(D_OUTPUT)"
	@ruby -c ../s3zip.rb
	@cat input/*.tf.in \
		| D_OUTPUT="$(D_OUTPUT)" ruby ../s3zip.rb --tf

.PHONY: stats
stats:
	@echo
	@echo "Input : `cat input/*.in  | wc -l` line(s)"
	@echo "Output: `cat output/*.tf | wc -l` line(s)"

.PHONY: clean
clean:
	@rm -fv $(D_OUTPUT)/*.json $(D_OUTPUT)/*.tf

.PHONY: all
all: clean autogen stats
