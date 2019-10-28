#!/usr/bin/env bash

export NX_HOME=$HOME/code/nx
export NX_TEST_PROJ_HOME=$HOME/code/nx-test
export NX_MODULES=( @nrwl )
export NX_ALL_MODULES=( @ngrx @nrwl angular @angular @angular-devkit codelyzer ngrx-store-freeze npm-run-all yargs yargs-parser
ng-packagr cypress jest @types/jest jest-preset-angular identity-obj-proxy karma karma-chrome-launcher karma-coverage-istanbul-reporter karma-jasmine karma-jasmine-html-reporter
jasmine-core jasmine-spec-reporter jasmine-marbles @types/jasmine @types/jasminewd2 @nestjs express @types/express react react-dom react-router-dom styled-components
@types/react @types/react-dom @types/react-router-dom @testing-library 

@babel/core @babel/preset-env @babel/preset-react @babel/preset-typescript @babel/plugin-proposal-class-properties @babel/plugin-proposal-decorators babel-loader babel-plugin-macros
eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react eslint-plugin-react-hooks

rollup rollup-plugin-babel rollup-plugin-commonjs rollup-plugin-filesize rollup-plugin-local-resolve rollup-plugin-node-resolve rollup-plugin-peer-deps-external
rollup-plugin-postcss rollup-plugin-typescript2

next next-server document-register-element )

function nxh() {
	cd $NX_HOME
}

function nxt() {
	cd $NX_TEST_PROJ_HOME
}

function nx-rebuild() {
	echo "=> rebuilding"
	. ./scripts/build.sh
	rm -rf node_modules/@nrwl
	cp -a build/packages node_modules/@nrwl
	echo "=> done"
}

function nx-refresh() {
	pushd $NX_HOME
	nx-rebuild
	if [ "$1" == "--all" ]
	then
		nx-copy-modules --all
	else
		nx-copy-modules
	fi
	popd
}

function nxr() {
	nx-refresh
}

function nx-copy-modules() {
	modules=$NX_MODULES
	if [[ -n "$1" ]]
	then
		modules=$NX_ALL_MODULES
	fi

	for mod in "${modules[@]}"
	do
		rm -rf "$NX_TEST_PROJ_HOME/node_modules/$mod"
		cp -a "$NX_HOME/node_modules/$mod" "$NX_TEST_PROJ_HOME/node_modules"
		echo "=> copied: $mod"
	done

	echo "=> done"
}
