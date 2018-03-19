#!/bin/bash
v=Alex
quiet=true
say_it () {
  echo $1
  if [ ! $quiet ] ; then
    say -v $v $1
  fi
}

### Setup Client directory structure
if [ -z "$1" ] ; then
  say -v $v "What is the Client's Name?"
  read -p "What is the Client's Name : " name
else
	name=$1
fi
if [ -z "$2" ] ; then
  say -v $v "What is the name of $1's Project?"
  read -p "What is the name of $1's Project : " pname
else
	pname=$2
fi
say_it "Congratulations on landing $pname for $name."

#build structure commands
cd ~/Projects/Clients
if [ -d "$name" ] && [ -d "$pname" ] ; then
  say_it "I'm sorry but a project named $pname already exists for $name. I'm exiting."
  exit 1
else
  mkdir -p $name/{files/{private/scratch,public/{Assets,Documents}},www,$pname/{build,src/vendor,dist,lib/vendor,test/{unit,integration,env},doc}}
fi

touch $name/$pname/README.md $name/$pname/LICENSE.md
echo "#$name TO DO" > $name/files/private/todo.md
echo "#$name Notes" > $name/files/private/notes.md
ln -s ~/Projects/Clients/$name/www ~/Sites/$name
ln -s ~/Projects/Clients/$name/files/private/todo.md ~/Sites/$name/odd_todo.md
ln -s ~/Projects/Clients/$name/files/private/notes.md ~/Sites/$name/odd_notes.md

### Softlink from file/public to a share service
if [ -z "$3" ] ; then
  say -v $v "Will their share be a Google or Dropbox?"
  read -p "Will their share be a Google or Dropbox? {g|d} " share
else
  share=$3
fi
if [ "g" == "$share" ] ; then
  say_it "Soft linking to Google then"
  echo $dest
  dest=/Volumes/GoogleDrive/My\ Drive/Clients/
  echo $dest
elif [ "d" == "$share" ] ; then
  say_it "Soft link to Dropbox coming right up"
  dest=~/Dropbox/Oddlots/Clients/
else
  say_it "I didn't understand what share service you wanted to setup. Skipping it for now."
  dest="foo"
fi
if [ -d "$dest" ] ; then
  mv ~/Projects/Clients/$name/files/public "$dest"$name
  ln -s "$dest"$name ~/Projects/Clients/$name/files/public
fi

### Wordpress
if [ -z "$4" ] ; then
  say -v $v "Will you want a Word-press site for them?"
  read -p "Will you want a Wordpress site for them? {y|n} " wp
else
  wp=$4
fi
if [ "y" == "$wp" ] || [ "" == "$wp" ] ; then
  say_it "Installing Wordpress"
  dbname=wp-$name
  cd ~/Sites/$name
  wp core download
  mysqladmin -u root -proot create $dbname
  wp core config --dbname=$dbname --dbuser=root --dbpass=root
  wp core install --url=http://$name.odd --title=$name --admin_user=sam --admin_password=sam --admin_email=sam@oddlots.org
else
  say_it "Right on. No wordpress"
fi
say_it "All finished! Get Crackin!"
