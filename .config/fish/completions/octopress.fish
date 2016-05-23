# Subcommands

complete -c octopress -n '__fish_use_subcommands' -x -a 'new' \
  -d 'Creates a new site with Jekyll and Octopress scaffolding at the specified path.'
complete -c octopress -n '__fish_use_subcommands' -x -a 'docs' \
  -d 'Launch local server with docs for Octopress v3.0.11 and Octopress plugins.'
complete -c octopress -n '__fish_use_subcommands' -x -a 'init' \
  -d "Add Octopress's default scaffolding to your site."
complete -c octopress -n '__fish_use_subcommands' -x -a 'publish' \
  -d 'Convert a draft to a normal published post.'
complete -c octopress -n '__fish_use_subcommands' -x -a 'unpublish' \
  -d 'Convert a post to a draft.'
complete -c octopress -n '__fish_use_subcommands' -x -a 'isolate' \
  -d 'Move all posts not matching selected post to _posts/_exile.'
complete -c octopress -n '__fish_use_subcommands' -x -a 'integrate' \
  -d 'Reintegrate posts from _posts/_exile.'
complete -c octopress -n '__fish_use_subcommands' -x -a 'ink' -d 'Work with your Octopress Ink plugins.'
complete -c octopress -n '__fish_use_subcommands' -x -a 'deploy' -d 'Deploy your Octopress site.'

# new

complete -c octopress -n '__fish_use_subcommands new' -x -s f -l force \
  -d 'Force creatin even if path already exists.'
complete -c octopress -n '__fish_use_subcommands new' -x -s b -l blank \
  -d 'Creates scaffoldiong but with empty files.'
complete -c octopress -n '__fish_use_subcommands new' -x -a page \
  -d 'Add a new page to your Jekyll site.'
complete -c octopress -n '__fish_use_subcommands new' -x -a post \
  -d 'Add a new post to your Jekyll site.'
complete -c octopress -n '__fish_use_subcommands new' -x -a draft \
  -d 'Add a new draft post to your Jekyll site.'

# new post
complete -c octopress -n '__fish_use_subcommands new post' -x -s d -l date \
  -d "Use 'now' or a String that is parseable by Time#parse."
complete -c octopress -n '__fish_use_subcommands new post' -x -s T -l template \
  -d 'New post from a template.'
complete -c octopress -n '__fish_use_subcommands new post' -x -s s -l slug \
  -d 'Use this slug in filename instead of sluggified post title.'
