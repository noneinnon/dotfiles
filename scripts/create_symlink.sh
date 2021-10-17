file=$1
target_path=$2

TARGET_PATH="/Users/${USER}"

if [[ $1 = "" ]]; then 
   echo "Provide a valid file or directory"
   exit 1
fi

if [[ ! -f $1 && ! -d $1 ]]; then 
   echo "$1 does not exist"
   exit 1
fi

if [[ $2 = "" ]]; then
   target_path="${TARGET_PATH}/${file}"
fi

absolute_filepath="$PWD/$file"

echo "Generatings symlink for $target_path"

ln -nfs $absolute_filepath $target_path 

echo "Success!"
exit 0
