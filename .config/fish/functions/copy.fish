function copy
    rsync \
      --archive \
      --verbose \
      --progress \
      --checksum \
      $argv
end
