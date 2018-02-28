#!/usr/bin/python
#coding=utf-8

import urllib
import urllib2
import time
#import chardet
import json

time.localtime(time.time())
if __name__ == "__main__":
	print '----------------------check in music 163 ----------------------'
	print time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))
	host = "music.163.com"
	api = "/weapi/point/dailyTask?csrf_token=f8a4e6ccd1e7c1208179aee381d9ea58"
	req_url = "https://"+host+api 
#	print 'Going to send post request to %s' %req_url
	
	post_data = "params=d2eKiufG9ArI6ohqfLXgHOcH%2F0ZLkN1yqKmk83RI9Fj%2BziH2Ubiieasa2ntQNUcUCVULbYgS7B2LSLQ8sDJlMamaEhvQoHIzQKOu8hBgDyXiHHZFc7ZIepg%2BjVCG7vDp&encSecKey=68ce9ee3f2a96a673fb719705309db3011647a969cd1d81b8f26739ed938117192fbbd369be597338e7b86ad742b74dc7d77fb0418fd927bb5d1335456cb98fa351d4f68e40fbfbb7fd6e91d20deb15ac83d065b1672f67a950ccd80bbdaed3e3e90e6d17258b2af030774bdb5aa6ef26f542436cd96466629e00e75f8ae3097"
#	print 'Post data is as follows: %s'%post_data
	
	request = urllib2.Request(url = req_url, data = post_data)
	request.add_header('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:56.0) Gecko/20100101 Firefox/56.0')
	request.add_header('Accept', '*/*')
	request.add_header('Accept-Language', 'zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3')
	request.add_header('Accpet-Encoding', 'gzip, deflate')
	request.add_header('Content-Type', 'application/x-www-form-urlencoded')
	request.add_header('Referer', 'http://music.163.com/discover')	
	request.add_header('Cookie', 'JSESSIONID-WYYY=h%2BO4iRBhCnGeVxm5EhyCB8VjbXTIxFthJFlqCkOAdc4pBeKShWlI31gCDyBYtZ%2BCielTsBUqB%5CpSot%5CeywG4ltjg51qro37A%5CCtau5CJ%5C9ejmdyHvZ05h0gc2WQVn%5CAwJ2n0HgMPgEM88FwY59hMfTQ%2BKzolD4MmVvi8X4Vdn5axw5pX%3A1509774069472; _iuqxldmzr_=32; _ntes_nnid=93bd187398740b09bcfa77459b580e3a,1502971401032; _ntes_nuid=93bd187398740b09bcfa77459b580e3a; __utma=94650624.1832616341.1502971402.1508657146.1509772271.4; __utmz=94650624.1502971402.1.1.utmcsr=baidu|utmccn=(organic)|utmcmd=organic; __csrf=f8a4e6ccd1e7c1208179aee381d9ea58; __remember_me=true; MUSIC_U=904008ecb2541319c967777a906a30b674750d6112b495968234e6639843e065912a5e4cdf16c4214e0353c7553e0781a70b41177f9edcea; __utmb=94650624.1.10.1509772271; __utmc=94650624')
#	print 'Headers are set...'
	try:
		response = urllib2.urlopen(request)
#		print 'Request has been sent...'
		result = response.read()
		
		print 'Desktop app: '+result
	except Exception, e:
		print u'%s'%str(e)
#	print '--------------------------------------------------------------\n'
	
	host = "music.163.com"
	api = "/eapi/point/dailyTask?_nmclfl=1"
	req_url = "https://"+host+api
#	print 'Going to send post request to %s' %req_url
	
	post_data = "params=04F1A0AB8150EFD085BC839891D19E2E488A2D6C2924C5589260A62E82B1A0D323979D4CA5992383A4384CA19D5D9B7815D1B72D9A70211266F380F4F706643270619DEE007BA7638B3318B1D2E2A64A233BB43F0F8B76F24D9AB171B538220CF9BEE8C45FE58B2C837E908924BF8FECC438B712864A337ED9DAB3BE5BFEFCFCD1BD232134EE0F7241230F0BA702A472EC47E7632E3F12B3C28478BF392128AB6C6A252E9A6F4B9A4BE75AF7558E50B01A6F2752B717A962FDBEC23866AF3878EC0DD650408627F2B39E55DC9CCC5A30D5E945D1D7F96701136EE9DCCFE84DE20BC8EF52256BC720BD361E1EEC2A874115D1B72D9A70211266F380F4F706643270619DEE007BA7638B3318B1D2E2A64ABB0B520B36F7B62359FB9EB25282CC538FEF32FF4F6F121AEA925A625DECA6EC4025A6ABF4CE1B1E14962185A5C5AFE0BA71F9076248E7A9ECEB2B884BA6C3B9E856ECE51DAB86AA0F72DB9808EC3DF149CB5C54E5422BB95CE326A0D730C4B767F2D83F5F8505DA33F1CF7043FFEE6B79B4CA799253E8DC79CE951210B1BDBDDCFB4C4E51C23A035E566CA7C4CB56BEEBA227CA34CE59B5CEE6E22082358F45F681FC595E0FB0A228CBDB657F0F5B2B82B7D7EA2A73E2AFEEDD5F2C119791229DC18B0262C37C673B78A002A3860504BF54FB01E3FE03396BBA05BBF06C109A96715CF1C08FAD760028EC39539F81FD54C89F60E6B5F991319752DA4C5F8DEF4C888336B2B3BAAF301A662B2BD332B3C1B5F865E0C0F565830D262C482C2C74F60D66F5DD5F44710FD59E2DDD7BA417276B958F3AA98FC571960D9ABE47DEC1519E037493FEE4C3BECDE6D3C58D5E97"
#	print 'Post data is as follows: %s'%post_data
	
	request = urllib2.Request(url = req_url, data = post_data)
	request.add_header('User-Agent', 'NeteaseMusic 4.2.2/876 (iPhone; iOS 11.0.3; zh_CN)')
	#request.add_header('Accpet-Encoding', 'gzip')
	request.add_header('Content-Type', 'application/x-www-form-urlencoded')
	request.add_header('Cookie', 'os=iPhone OS; osver=11.0.3; appver=4.2.2; deviceId=1392f74c502c76e83f6520ee8716302c; MUSIC_U=904008ecb2541319cd98361910cbce76ff831de86a591bfeb89d55fb5c09937df8071f13363fd79d3e12f3b6db88a66631b299d667364ed3')
#	print 'Headers are set...'
	try:
		response = urllib2.urlopen(request)
#		print 'Request has been sent...'
		result = response.read()
		#print chardet.detect(result)
		#print response.info()
		print 'iPhone app: ' + result
	except Exception, e:
		print u'%s'%str(e)
	print '--------------------------------------------------------------\n'
	
