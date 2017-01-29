ROOT_DIR  := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
HOOKS_DIR := ${ROOT_DIR}/.git/hooks

HOOKS = pre-commit post-merge

init:
	for hook in ${HOOKS}; do                         \
	  echo ${ROOT_DIR}/$$hook;                       \
	  ln -sf ${ROOT_DIR}/$$hook ${HOOKS_DIR}/$$hook; \
	  chmod +x ${HOOKS_DIR}/$$hook;                  \
	  echo Done.;                                    \
	done

