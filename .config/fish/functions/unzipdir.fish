function unzipdir
  unzip $argv -d (basename -s .zip $argv)
end
