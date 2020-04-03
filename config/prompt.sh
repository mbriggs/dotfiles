
git_dirty() {
  git diff --quiet --ignore-submodules HEAD 2>/dev/null; if [ $? -eq 1 ]; then echo " ${green}✓${normal}"; else echo " ${bold_red}→ ${normal}"; fi
}

pure_prompt() {
    ps_host="${blue}\h${normal}";
    ps_user_mark="${red}→ ${normal}";
    ps_path="${bold_blue}\w${normal}";

    export PS1="\n$ps_host $ps_path \$(git symbolic-ref --short HEAD 2>/dev/null)\n$ps_user_mark"
}

pure_prompt;
