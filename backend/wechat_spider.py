#!/usr/bin/python
#coding=utf-8

import wechatsogou
import MySQLdb
import MySQLdb.cursors
import time

host='127.0.0.1'
user='web_user'
passwd='shuangzi19940621'
port=3306
db='my_space'
charset='utf8'

ws_api=wechatsogou.WechatSogouAPI()

conn=MySQLdb.connect(host=host,port=port,user=user,passwd=passwd,db=db,charset=charset,cursorclass=MySQLdb.cursors.DictCursor)
cursor=conn.cursor()

sql='select * from news_platform'
print sql
cursor.execute(sql)
gzh_list=cursor.fetchall();
for each in gzh_list:
	gzh_id=each['news_platform_id']
	finduser_sql="select * from user natural join news_subscribtion where news_platform_id=%"%gzh_id
	cursor.execute(finduser_sql)
	user_list=cursor.fetchall();
	gzh_name=each['news_platform_name']
	print gzh_name
	recent_articles=ws_api.get_gzh_article_by_history(gzh_name)
	flag=1
	for article in recent_articles['article']:
		article_title=article['title']
		print article_title
		article_time=article['datetime']
		timeArray=time.localtime(article_time)
		article_time = time.strftime("%Y-%m-%d %H:%M:%S", timeArray)
		article_abstract=article['abstract']
		print article_abstract
		article_url=article['content_url']
		sql='select count(*) as n from news where news_title="%s"'%article_title
		res=cursor.execute(sql)
		n=cursor.fetchall()
		if(n[0]['n']==0):
			if(flag==1):
				flag=0
				for user in user_list:
					msg_receiver=user['user_id']
					msg_sender=gzh_id
					msg_time=time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time.time()))
					#msg_content=''%(gzh_id,gzh_name)
					msg_sql='insert into message(msg_type_id, msg_content, msg_time, msg_sender, msg_receiver) values("2","<a href=\'./news_platform_articles.php?news_platform_id=%s\'>《%s》</a>有了新的文章。","%s","%s","%s")'%(gzh_id,gzh_name,msg_time,msg_sender,msg_receiver)
					print msg_sql
					cursor.execute(msg_sql)
			print 'adding article: %s'%article_title
			sql='insert into news(news_time,news_content,news_platform_id,news_title,news_url) values("%s","%s","%s","%s","%s")'%(article_time,article_abstract,gzh_id,article_title,article_url)
			cursor.execute(sql)


#for each in gzh_list:
#	print each
#	gzh_info=ws_api.get_gzh_info(each)
#	authentication=gzh_info['authentication']
#	introduction=gzh_info['introduction']
#	wechat_id=gzh_info['wechat_id']
#	headimage=gzh_info['headimage']
#	open_id=gzh_info['open_id']
#	wechat_name=gzh_info['wechat_name']
#	profile_url=gzh_info['profile_url']
#	qr_code=gzh_info['qrcode']
	#cursor.execute('insert into news_platform(news_platform_name,news_platform_info,news_platform_url,news_platform_image,open_id,wechat_id,authentication,qr_code) values(\'%s\',\'%s\',\'%s\',\'%s\',\'%s\',\'%s\',\'%s\',\'%s\')'%(wechat_name,introduction,profile_url,headimage,open_id,wechat_id,authentication,qr_code))
#	print '\nsql: insert into news_platform(news_platform_name,news_platform_info,news_platform_url,news_platform_image,open_id,wechat_id,authentication,qr_code) values("%s","%s","%s","%s","%s","%s","%s","%s")'%(wechat_name,introduction,profile_url,headimage,open_id,wechat_id,authentication,qr_code)
#	cursor.execute('insert into news_platform(news_platform_name,news_platform_info,news_platform_url,news_platform_image,open_id,wechat_id,authentication,qr_code) values("%s","%s","%s","%s","%s","%s","%s","%s")'%(wechat_name,introduction,profile_url,headimage,open_id,wechat_id,authentication,qr_code))
#	conn.commit()
	#values=cursor.fetchall()
	#print values
conn.commit()
cursor.close()
conn.close