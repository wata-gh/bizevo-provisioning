bizevo-provisioning
===================

bizevoをローカル開発するために必要な手順をまとめます。（仮）

## install VirtualBox and more...
```
 FIXME
```

## clone 
```
git clone https://github.com/wata-gh/bizevo-provisioning.git
```

## set up vagrant
```
 vagrant ssh-config とかそんな感じ
```

## vagrant up
```
cd bizevo-provisioning
vagrant up
```
- verによっては下記のエラーが出ることがあります。
```
Failed to mount folders in Linux guest. This is usually because
the "vboxsf" file system is not available. Please verify that
the guest additions are properly installed in the guest and
can work properly. The command attempted was:

mount -t vboxsf -o uid=`id -u vagrant`,gid=`getent group vagrant | cut -d: -f3` vagrant /vagrant
mount -t vboxsf -o uid=`id -u vagrant`,gid=`id -g vagrant` vagrant /vagrant

The error output from the last command was:

/sbin/mount.vboxsf: mounting failed with the error: No such device
```
	- 今の所影響が出ていないので、無視。
	- 解法のヒント。
		- http://qiita.com/chobi9999/items/7b66677b3bf3da8acc14

## berks install
```
 berks install
```

## knife solo
```
 knife solo prepare vagrant@bizevo
 knife solo cook vagrant@bizevo
```

- 実行時に以下のエラーが出てしまいます。アクセスキーなどを先輩に聞きましょう。
```
================================================================================
    Error executing action `create` on resource 's3_file[/home/vagrant/work/oracle-instantclient-basic-10.2.0.5-1.x86_64.rpm]'
    ================================================================================
    
    AWS::S3::Errors::InvalidAccessKeyId
    -----------------------------------
    The AWS Access Key Id you provided does not exist in our records.
```
- モジュールを一時的に修正します。（セキュリティ情報なのでCOMMIT/PUSHは厳禁）
  - https://github.com/wata-gh/bizevo-provisioning/blob/develop/site-cookbooks/s3_file/libraries/s3_file.rb#L57-L58

