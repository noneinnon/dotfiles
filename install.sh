FILES_TO_SKIP=( 'scripts' '.config' '.' '..' $0 '.git' 'README.md' );

[[ ! $USER ]] && echo "Current user is not defined" && exit 1

link_file() {
	local file=$1
	echo $file
		if [[ ! " ${FILES_TO_SKIP[*]} " =~ " ${file} " ]]; then
		echo "linking $file"
		echo "..."
		bash "scripts/create_symlink.sh" $file
		fi
}

for file in $( ls -a ); do
	echo $file
	link_file $file;
done

cd .config

for file in $( ls -a ); do
	echo $file
	link_file $file;
done
