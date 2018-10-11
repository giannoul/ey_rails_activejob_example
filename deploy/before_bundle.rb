#show the existing %environment%_credentials.yml.enc files
run "ls -lhart #{config.release_path}/config/ | grep credentials.yml.enc"

#move the %environment%_credentials.yml.enc to credentials.yml.enc for the current environment
run "echo 'Move #{config.release_path}/config/#{config.environment_name}_credentials.yml.enc to #{config.release_path}/config/credentials.yml.enc' "
run "mv #{config.release_path}/config/#{config.environment_name}_credentials.yml.enc #{config.release_path}/config/credentials.yml.enc"

#delete all the %environment%_credentials.yml.enc where %environment% is not the current environment being deployed
run "echo 'Delete all *_credentials.yml.enc files under #{config.release_path}/config/ except credentials.yml.enc' "
run "find #{config.release_path}/config/ -name '*_credentials.yml.enc' -delete"

#check the results of the deletion of the unsused %environment%_credentials.yml.enc files
run "ls -lhart #{config.release_path}/config/ | grep credentials.yml.enc"

#source the cloud.env file
run "source #{config.shared_path}/config/env.cloud"
run "echo $UNICORN_VERSION"