## some nice tools that report statistics to riemann
## see the list here:
## https://github.com/aphyr/riemann-tools/tree/master/bin

class riemann::riemann_tools{
  include riemann::params
  package{'riemann-tools': provider => 'gem'}
}