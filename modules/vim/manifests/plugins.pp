# Installs and configures my vim plugins
class vim::plugins {
  include ::vim::installation::youcompleteme
  include ::vim::installation::commandt
}
