#!/usr/bin/python
#coding=utf-8

import wechatsogou
import MySQLdb
import urllib,urllib2

host='127.0.0.1'
user='web_user'
passwd='shuangzi19940621'
port=3306
db='my_space'
charset='utf8'
img_dir='./images/platform/'

ws_api=wechatsogou.WechatSogouAPI()
gzh_list=('新华社','看雪学院','Python编程','大数据技术','阿里技术','人工智能头条')

conn=MySQLdb.connect(host=host,port=port,user=user,passwd=passwd,db=db,charset=charset)
cursor=conn.cursor()

for each in gzh_list:
	print each
	gzh_info=ws_api.get_gzh_info(each)
	authentication=gzh_info['authentication']
	introduction=gzh_info['introduction']
	wechat_id=gzh_info['wechat_id']
	headimage=gzh_info['headimage']
	open_id=gzh_info['open_id']
	wechat_name=gzh_info['wechat_name']
	profile_url=gzh_info['profile_url']
	qr_code=gzh_info['qrcode']

	request=urllib2.Request(headimage)
	response=urllib2.urlopen(request)
	img=response.read()
	new_img='../images/platform/%s.jpg'%wechat_name
	with open(new_img,'wb') as f:
		f.write(img)
	headimage='%s%s.jpg'%(img_dir,wechat_name)
	print headimage
	
	#print '\nsql: insert into news_platform(news_platform_name,news_platform_info,news_platform_url,news_platform_image,open_id,wechat_id,authentication,qr_code) values("%s","%s","%s","%s","%s","%s","%s","%s")'%(wechat_name,introduction,profile_url,headimage,open_id,wechat_id,authentication,qr_code)
	cursor.execute('insert into news_platform(news_platform_name,news_platform_info,news_platform_url,news_platform_image,open_id,wechat_id,authentication,qr_code) values("%s","%s","%s","%s","%s","%s","%s","%s")'%(wechat_name,introduction,profile_url,headimage,open_id,wechat_id,authentication,qr_code))
	conn.commit()
	#values=cursor.fetchall()
	#print values
cursor.close()
conn.close