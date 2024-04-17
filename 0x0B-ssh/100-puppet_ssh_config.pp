#!/usr/bin/env bash
# using puppet to connect without a password

file { '/etc/ssh/ssh_config':
	ensure -> present,
}

file_line { 'Turn off passwd auth':
	path => '/etc/ssh/ssh_config',
	line => 'passwordAuthentification no',
	match => '^#PasswordAuthentification',
}

file_line { 'Declare identity file':
	path => '/etc/ssh/ssh_config',
	line => 'IdentityFile ~/.ssh/school',
	match => '^#IdentityFile',
}
