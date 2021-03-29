let JkSmtpSMTPMessage = function() {
	this.rcptsTo = null;
	this.rcptsCC = null;
	this.rcptsBCC = null;
	this.replyTo = null;
	this.subject = null;
	this.contentType = null;
	this.text = null;
	this.myName = null;
	this.myAddress = null;
	this.messageBody = null;
	this.messageID = null;
	this.date = null;
	this.excludeAddresses = null;
};

JkSmtpSMTPMessage.prototype._t = { "JkSmtpSMTPMessage" : true };
JkSmtpSMTPMessage.prototype._tobj = JkSmtpSMTPMessage;

JkSmtpSMTPMessage.NEW = function() {
	var v = new JkSmtpSMTPMessage;
	return v.CTOR_JkSmtpSMTPMessage();
};

JkSmtpSMTPMessage.prototype.CTOR_JkSmtpSMTPMessage = function() {
	this.excludeAddresses = null;
	this.date = null;
	this.messageID = null;
	this.messageBody = null;
	this.myAddress = null;
	this.myName = null;
	this.text = null;
	this.contentType = null;
	this.subject = null;
	this.replyTo = null;
	this.rcptsBCC = null;
	this.rcptsCC = null;
	this.rcptsTo = null;
	this.date = JkTimeFormatVerboseDateTimeString.forUTCNow();
	return this;
};

JkSmtpSMTPMessage.prototype.onChanged = function() {
	this.messageBody = null;
};

JkSmtpSMTPMessage.prototype.generateMessageID = function(host) {
	this.messageID = (JkLangString.safeString((JkLangString.forLongInteger((JkTimeSystemClock.asSeconds()))))) + ("-") + (JkLangString.safeString((JkLangString.forInteger((JkRandomRandom.NEW().nextInt2(1000000)))))) + ("-") + (JkLangString.safeString((JkLangString.forInteger(JkSmtpSMTPMessage.counter)))) + ("@") + (JkLangString.safeString(host));
	JkSmtpSMTPMessage.counter++;
	this.onChanged();
	return this;
};

JkSmtpSMTPMessage.prototype.getDate = function() {
	return this.date;
};

JkSmtpSMTPMessage.prototype.getReplyTo = function() {
	return this.replyTo;
};

JkSmtpSMTPMessage.prototype.setDate = function(date) {
	this.date = date;
	this.onChanged();
	return this;
};

JkSmtpSMTPMessage.prototype.setMessageID = function(id) {
	this.messageID = id;
	this.onChanged();
	return this;
};

JkSmtpSMTPMessage.prototype.setReplyTo = function(v) {
	this.replyTo = v;
	this.onChanged();
	return this;
};

JkSmtpSMTPMessage.prototype.getMessageID = function() {
	return this.messageID;
};

JkSmtpSMTPMessage.prototype.isExcludedAddress = function(add) {
	if(this.excludeAddresses == null || this.excludeAddresses.getSize() < 1) {
		return false;
	}
	var array = this.excludeAddresses.toVector();
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var ea = (function(o) {
				if(typeof(o) === 'string') {
					return o;
				}
				return null;
			}.bind(this))(array[n]);
			if(ea != null) {
				if(JkLangString.equals(ea, add)) {
					return true;
				}
			}
		}
	}
	return false;
};

JkSmtpSMTPMessage.prototype.getAllRcpts = function() {
	var rcpts = JkLangDynamicVector.NEW();
	if(this.rcptsTo != null) {
		var array = this.rcptsTo.toVector();
		if(array != null) {
			var n = 0;
			var m = array.length;
			for(n = 0 ; n < m ; n++) {
				var r = (function(o) {
					if(typeof(o) === 'string') {
						return o;
					}
					return null;
				}.bind(this))(array[n]);
				if(r != null) {
					if(this.isExcludedAddress(r)) {
						continue;
					}
					rcpts.appendObject(r);
				}
			}
		}
	}
	if(this.rcptsCC != null) {
		var array2 = this.rcptsCC.toVector();
		if(array2 != null) {
			var n2 = 0;
			var m2 = array2.length;
			for(n2 = 0 ; n2 < m2 ; n2++) {
				var r1 = (function(o1) {
					if(typeof(o1) === 'string') {
						return o1;
					}
					return null;
				}.bind(this))(array2[n2]);
				if(r1 != null) {
					if(this.isExcludedAddress(r1)) {
						continue;
					}
					rcpts.appendObject(r1);
				}
			}
		}
	}
	if(this.rcptsBCC != null) {
		var array3 = this.rcptsBCC.toVector();
		if(array3 != null) {
			var n3 = 0;
			var m3 = array3.length;
			for(n3 = 0 ; n3 < m3 ; n3++) {
				var r2 = (function(o2) {
					if(typeof(o2) === 'string') {
						return o2;
					}
					return null;
				}.bind(this))(array3[n3]);
				if(r2 != null) {
					if(this.isExcludedAddress(r2)) {
						continue;
					}
					rcpts.appendObject(r2);
				}
			}
		}
	}
	return rcpts;
};

JkSmtpSMTPMessage.prototype.getRcptsTo = function() {
	return this.rcptsTo;
};

JkSmtpSMTPMessage.prototype.getRcptsCC = function() {
	return this.rcptsCC;
};

JkSmtpSMTPMessage.prototype.getRcptsBCC = function() {
	return this.rcptsBCC;
};

JkSmtpSMTPMessage.prototype.getSubject = function() {
	return this.subject;
};

JkSmtpSMTPMessage.prototype.getContentType = function() {
	return this.contentType;
};

JkSmtpSMTPMessage.prototype.getText = function() {
	return this.text;
};

JkSmtpSMTPMessage.prototype.getMyName = function() {
	return this.myName;
};

JkSmtpSMTPMessage.prototype.getMyAddress = function() {
	return this.myAddress;
};

JkSmtpSMTPMessage.prototype.setSubject = function(s) {
	this.subject = s;
	this.onChanged();
	return this;
};

JkSmtpSMTPMessage.prototype.setContentType = function(c) {
	this.contentType = c;
	this.onChanged();
	return this;
};

JkSmtpSMTPMessage.prototype.setText = function(t) {
	this.text = t;
	this.onChanged();
	return this;
};

JkSmtpSMTPMessage.prototype.setMyName = function(n) {
	this.myName = n;
	this.onChanged();
	return this;
};

JkSmtpSMTPMessage.prototype.setMyAddress = function(a) {
	this.myAddress = a;
	this.onChanged();
	return this;
};

JkSmtpSMTPMessage.prototype.setTo = function(address) {
	this.rcptsTo = JkLangDynamicVector.NEW();
	this.rcptsTo.appendObject(address);
	this.onChanged();
	return this;
};

JkSmtpSMTPMessage.prototype.addTo = function(address) {
	if(JkLangString.isNotEmpty(address)) {
		if(!(this.rcptsTo != null)) {
			this.rcptsTo = JkLangDynamicVector.NEW();
		}
		this.rcptsTo.appendObject(address);
	}
	this.onChanged();
	return this;
};

JkSmtpSMTPMessage.prototype.addCC = function(address) {
	if(JkLangString.isNotEmpty(address)) {
		if(!(this.rcptsCC != null)) {
			this.rcptsCC = JkLangDynamicVector.NEW();
		}
		this.rcptsCC.appendObject(address);
	}
	this.onChanged();
	return this;
};

JkSmtpSMTPMessage.prototype.addBCC = function(address) {
	if(JkLangString.isNotEmpty(address)) {
		if(!(this.rcptsBCC != null)) {
			this.rcptsBCC = JkLangDynamicVector.NEW();
		}
		this.rcptsBCC.appendObject(address);
	}
	this.onChanged();
	return this;
};

JkSmtpSMTPMessage.prototype.setRecipients = function(to, cc, bcc) {
	this.rcptsTo = to;
	this.rcptsCC = cc;
	this.rcptsBCC = bcc;
	this.onChanged();
	return this;
};

JkSmtpSMTPMessage.prototype.getSizeBytes = function() {
	var b = this.getMessageBody();
	if(!(b != null)) {
		return 0;
	}
	var bb = JkLangString.toUTF8Buffer(b);
	if(!(bb != null)) {
		return 0;
	}
	return ~(~JkLangBuffer.getSize(bb));
};

JkSmtpSMTPMessage.prototype.getMessageBody = function() {
	if(this.messageBody != null) {
		return this.messageBody;
	}
	var sb = JkLangStringBuilder.NEW();
	sb.appendString("From: ");
	sb.appendString(this.myName);
	sb.appendString(" <");
	sb.appendString(this.myAddress);
	if(JkLangString.isNotEmpty(this.replyTo)) {
		sb.appendString(">\r\nReply-To: ");
		sb.appendString(this.myName);
		sb.appendString(" <");
		sb.appendString(this.replyTo);
	}
	sb.appendString(">\r\nTo: ");
	var first = true;
	if(this.rcptsTo != null) {
		var array = this.rcptsTo.toVector();
		if(array != null) {
			var n = 0;
			var m = array.length;
			for(n = 0 ; n < m ; n++) {
				var to = (function(o) {
					if(typeof(o) === 'string') {
						return o;
					}
					return null;
				}.bind(this))(array[n]);
				if(to != null) {
					if(!first) {
						sb.appendString(", ");
					}
					sb.appendString(to);
					first = false;
				}
			}
		}
	}
	sb.appendString("\r\nCc: ");
	first = true;
	if(this.rcptsCC != null) {
		var array2 = this.rcptsCC.toVector();
		if(array2 != null) {
			var n2 = 0;
			var m2 = array2.length;
			for(n2 = 0 ; n2 < m2 ; n2++) {
				var to1 = (function(o1) {
					if(typeof(o1) === 'string') {
						return o1;
					}
					return null;
				}.bind(this))(array2[n2]);
				if(to1 != null) {
					if(!first) {
						sb.appendString(", ");
					}
					sb.appendString(to1);
					first = false;
				}
			}
		}
	}
	sb.appendString("\r\nSubject: ");
	sb.appendString(this.subject);
	sb.appendString("\r\nContent-Type: ");
	sb.appendString(this.contentType);
	sb.appendString("\r\nDate: ");
	sb.appendString(this.date);
	if(JkLangString.isNotEmpty(this.messageID)) {
		sb.appendString("\r\nMessage-ID: <");
		sb.appendString(this.messageID);
		sb.appendString(">");
	}
	sb.appendString("\r\n\r\n");
	sb.appendString(this.text);
	this.messageBody = sb.toString();
	return this.messageBody;
};

JkSmtpSMTPMessage.prototype.getExcludeAddresses = function() {
	return this.excludeAddresses;
};

JkSmtpSMTPMessage.prototype.setExcludeAddresses = function(v) {
	this.excludeAddresses = v;
	return this;
};

JkSmtpSMTPMessage.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSmtpSMTPMessage"] === true;
};

JkSmtpSMTPMessage.counter = 0;

let JkSmtpSMTPClientTransactionResult = function() {
	this.status = false;
	this.errorMessage = null;
	this.domain = null;
	this.server = null;
	this.recipients = null;
};

JkSmtpSMTPClientTransactionResult.prototype._t = { "JkSmtpSMTPClientTransactionResult" : true };
JkSmtpSMTPClientTransactionResult.prototype._tobj = JkSmtpSMTPClientTransactionResult;

JkSmtpSMTPClientTransactionResult.NEW = function() {
	var v = new JkSmtpSMTPClientTransactionResult;
	return v.CTOR_JkSmtpSMTPClientTransactionResult();
};

JkSmtpSMTPClientTransactionResult.prototype.CTOR_JkSmtpSMTPClientTransactionResult = function() {
	this.recipients = null;
	this.server = null;
	this.domain = null;
	this.errorMessage = null;
	this.status = false;
	return this;
};

JkSmtpSMTPClientTransactionResult.forError = function(error) {
	return JkSmtpSMTPClientTransactionResult.NEW().setStatus(false).setErrorMessage(error);
};

JkSmtpSMTPClientTransactionResult.forNetworkError = function() {
	return JkSmtpSMTPClientTransactionResult.forError("Network communications error");
};

JkSmtpSMTPClientTransactionResult.forSuccess = function() {
	return JkSmtpSMTPClientTransactionResult.NEW().setStatus(true);
};

JkSmtpSMTPClientTransactionResult.prototype.getStatus = function() {
	return this.status;
};

JkSmtpSMTPClientTransactionResult.prototype.setStatus = function(v) {
	this.status = v;
	return this;
};

JkSmtpSMTPClientTransactionResult.prototype.getErrorMessage = function() {
	return this.errorMessage;
};

JkSmtpSMTPClientTransactionResult.prototype.setErrorMessage = function(v) {
	this.errorMessage = v;
	return this;
};

JkSmtpSMTPClientTransactionResult.prototype.getDomain = function() {
	return this.domain;
};

JkSmtpSMTPClientTransactionResult.prototype.setDomain = function(v) {
	this.domain = v;
	return this;
};

JkSmtpSMTPClientTransactionResult.prototype.getServer = function() {
	return this.server;
};

JkSmtpSMTPClientTransactionResult.prototype.setServer = function(v) {
	this.server = v;
	return this;
};

JkSmtpSMTPClientTransactionResult.prototype.getRecipients = function() {
	return this.recipients;
};

JkSmtpSMTPClientTransactionResult.prototype.setRecipients = function(v) {
	this.recipients = v;
	return this;
};

JkSmtpSMTPClientTransactionResult.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSmtpSMTPClientTransactionResult"] === true;
};

let JkSmtpSMTPSender = function() {
	this.thisServerAddress = null;
	this.server = null;
	this.myName = null;
	this.myAddress = null;
	this.ctx = null;
	this.maxSenderCount = 0;
	this.acceptInvalidCertificate = false;
	this.serverInternal = null;
	this.senderCount = 0;
};

JkSmtpSMTPSender.prototype._t = { "JkSmtpSMTPSender" : true };
JkSmtpSMTPSender.prototype._tobj = JkSmtpSMTPSender;

JkSmtpSMTPSender.NEW = function() {
	var v = new JkSmtpSMTPSender;
	return v.CTOR_JkSmtpSMTPSender();
};

JkSmtpSMTPSender.prototype.CTOR_JkSmtpSMTPSender = function() {
	this.senderCount = 0;
	this.serverInternal = null;
	this.acceptInvalidCertificate = false;
	this.maxSenderCount = 0;
	this.ctx = null;
	this.myAddress = null;
	this.myName = null;
	this.server = null;
	this.thisServerAddress = null;
	this.thisServerAddress = "smtpclient.jkop";
	return this;
};

JkSmtpSMTPSender.forCommonDetails = function(serverAddress, serverUsername, serverPassword, senderName, senderAddress) {
	var config = JkLangDynamicMap.NEW();
	config.setString("server_type", "smtp+ssl");
	config.setString("server_username", serverUsername);
	config.setString("server_password", serverPassword);
	config.setString("server_address", serverAddress);
	config.setString("sender_name", senderName);
	config.setString("sender_address", senderAddress);
	return JkSmtpSMTPSender.forConfiguration(config, null);
};

JkSmtpSMTPSender.forRemoteServerUrl = function(url) {
	var v = JkSmtpSMTPSender.NEW();
	v.setServer(url);
	return v;
};

JkSmtpSMTPSender.forServerAddress = function(name, ctx) {
	return JkSmtpSMTPSender.NEW().setThisServerAddress(name).setCtx(ctx);
};

JkSmtpSMTPSender.forConfiguration = function(config, ctx) {
	return JkSmtpSMTPSender.NEW().setCtx(ctx).configure(config);
};

JkSmtpSMTPSender.prototype.getDescription = function() {
	var sb = JkLangStringBuilder.NEW();
	if(JkLangString.isEmpty(this.myName) == false) {
		sb.appendCharacter('\"'.charCodeAt());
		sb.appendString(this.myName);
		sb.appendCharacter('\"'.charCodeAt());
	}
	if(JkLangString.isEmpty(this.myAddress) == false) {
		var hasName = false;
		if(sb.count() > 0) {
			hasName = true;
		}
		if(hasName) {
			sb.appendCharacter(' '.charCodeAt());
			sb.appendCharacter('<'.charCodeAt());
		}
		sb.appendString(this.myAddress);
		if(hasName) {
			sb.appendCharacter('>'.charCodeAt());
		}
	}
	var s = this.serverInternal;
	if(JkLangString.isEmpty(s)) {
		s = this.server;
	}
	if(JkLangString.isEmpty(s) == false) {
		sb.appendCharacter(' '.charCodeAt());
		sb.appendCharacter('('.charCodeAt());
		sb.appendString(s);
		sb.appendCharacter(')'.charCodeAt());
	}
	if(sb.count() < 1) {
		sb.appendString("(no configuration; raw passhtrough of messages)");
	}
	return sb.toString();
};

JkSmtpSMTPSender.prototype.configure = function(config) {
	if(config == null) {
		return this;
	}
	var defaultPort = "25";
	var scheme = config.getString("server_type", "smtp");
	if(JkLangString.equals("smtp+ssl", scheme)) {
		defaultPort = "465";
	}
	var url = JkUrlURL.NEW().setScheme(scheme).setUsername((config.getString("server_username", null))).setPassword((config.getString("server_password", null))).setHost((config.getString("server_address", null))).setPort((config.getString("server_port", defaultPort)));
	this.setServer((url.toString()));
	url.setPassword(null);
	this.serverInternal = url.toString();
	this.setMyName((config.getString("sender_name", "SMTP")));
	this.setMyAddress((config.getString("sender_address", "my@address.com")));
	this.setThisServerAddress((config.getString("this_server_address", this.thisServerAddress)));
	this.setAcceptInvalidCertificate((config.getBoolean("accept_invalid_certificate", this.acceptInvalidCertificate)));
	return this;
};

JkSmtpSMTPSender.prototype.onSendStart = function() {
	this.senderCount++;
	JkLogLog.debug(this.ctx, "SMTP send start: Now " + (JkLangString.safeString((JkLangString.forInteger(this.senderCount)))) + (" sender(s)"));
};

JkSmtpSMTPSender.prototype.onSendEnd = function() {
	this.senderCount--;
	JkLogLog.debug(this.ctx, "SMTP send end: Now " + (JkLangString.safeString((JkLangString.forInteger(this.senderCount)))) + (" sender(s)"));
};

JkSmtpSMTPSender.prototype.send = function(msg, listener) {
	if(msg == null) {
		if(listener != null) {
			listener.onSMTPSendComplete(msg, (JkSmtpSMTPClientResult.forError("No message to send", null)));
		}
		return;
	}
	var rcpts = msg.getAllRcpts();
	if(rcpts == null || rcpts.getSize() < 1) {
		if(listener != null) {
			listener.onSMTPSendComplete(msg, (JkSmtpSMTPClientResult.forSuccess()));
		}
		return;
	}
	if(this.maxSenderCount > 0 && this.senderCount > this.maxSenderCount) {
		JkLogLog.warning(this.ctx, "Reached maximum sender count " + (JkLangString.safeString((JkLangString.forInteger(this.maxSenderCount)))));
		if(listener != null) {
			listener.onSMTPSendComplete(msg, (JkSmtpSMTPClientResult.forError("Maximum number of SMTP senders has been exceeded.", null)));
		}
		return;
	}
	if(JkLangString.isEmpty(this.myName) == false) {
		msg.setMyName(this.myName);
	}
	if(JkLangString.isEmpty(this.myAddress) == false) {
		msg.setMyAddress(this.myAddress);
	}
	var sct = JkSmtpSMTPClientTask.NEW();
	if(JkLangString.isEmpty(this.server) == false) {
		sct.setServer((JkUrlURL.forString(this.server, false)));
	}
	sct.setCtx(this.ctx);
	sct.setServerAddress(this.thisServerAddress);
	sct.setMsg(msg);
	sct.setListener(listener);
	sct.setSender(this);
	sct.setAcceptInvalidCertificate(this.acceptInvalidCertificate);
	if(JkThreadThread.start(sct) == null) {
		JkLogLog.error(this.ctx, "Failed to start SMTP sender background task");
		if(listener != null) {
			listener.onSMTPSendComplete(msg, (JkSmtpSMTPClientResult.forError("Failed to start SMTP sender background task", null)));
		}
		return;
	}
	this.onSendStart();
};

JkSmtpSMTPSender.prototype.sendSync = function(msg) {
	if(!(msg != null)) {
		return JkSmtpSMTPClientResult.forError("No message was given to SMTPClientTask", msg);
	}
	if(this.maxSenderCount > 0 && this.senderCount > this.maxSenderCount) {
		JkLogLog.warning(this.ctx, "Reached maximum sender count " + (JkLangString.safeString((JkLangString.forInteger(this.maxSenderCount)))));
		return JkSmtpSMTPClientResult.forError("Maximum number of SMTP senders has been exceeded.", null);
	}
	if(JkLangString.isNotEmpty(this.myName)) {
		msg.setMyName(this.myName);
	}
	if(JkLangString.isNotEmpty(this.myAddress)) {
		msg.setMyAddress(this.myAddress);
	}
	var sct = JkSmtpSMTPClientTask.NEW();
	if(JkLangString.isEmpty(this.server) == false) {
		sct.setServer((JkUrlURL.forString(this.server, false)));
	}
	this.onSendStart();
	var r = JkSmtpSMTPClient.sendMessage(msg, (JkUrlURL.forString(this.server, false)), this.thisServerAddress, this.ctx, this.acceptInvalidCertificate);
	if(!(r != null)) {
		r = JkSmtpSMTPClientResult.forError("Unknown error", msg);
	}
	this.onSendEnd();
	return r;
};

JkSmtpSMTPSender.prototype.getThisServerAddress = function() {
	return this.thisServerAddress;
};

JkSmtpSMTPSender.prototype.setThisServerAddress = function(v) {
	this.thisServerAddress = v;
	return this;
};

JkSmtpSMTPSender.prototype.getServer = function() {
	return this.server;
};

JkSmtpSMTPSender.prototype.setServer = function(v) {
	this.server = v;
	return this;
};

JkSmtpSMTPSender.prototype.getMyName = function() {
	return this.myName;
};

JkSmtpSMTPSender.prototype.setMyName = function(v) {
	this.myName = v;
	return this;
};

JkSmtpSMTPSender.prototype.getMyAddress = function() {
	return this.myAddress;
};

JkSmtpSMTPSender.prototype.setMyAddress = function(v) {
	this.myAddress = v;
	return this;
};

JkSmtpSMTPSender.prototype.getCtx = function() {
	return this.ctx;
};

JkSmtpSMTPSender.prototype.setCtx = function(v) {
	this.ctx = v;
	return this;
};

JkSmtpSMTPSender.prototype.getMaxSenderCount = function() {
	return this.maxSenderCount;
};

JkSmtpSMTPSender.prototype.setMaxSenderCount = function(v) {
	this.maxSenderCount = v;
	return this;
};

JkSmtpSMTPSender.prototype.getAcceptInvalidCertificate = function() {
	return this.acceptInvalidCertificate;
};

JkSmtpSMTPSender.prototype.setAcceptInvalidCertificate = function(v) {
	this.acceptInvalidCertificate = v;
	return this;
};

JkSmtpSMTPSender.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSmtpSMTPSender"] === true;
};

let JkSmtpSMTPClientTaskResult = function() {
	this.message = null;
	this.status = false;
};

JkSmtpSMTPClientTaskResult.prototype._t = { "JkSmtpSMTPClientTaskResult" : true };
JkSmtpSMTPClientTaskResult.prototype._tobj = JkSmtpSMTPClientTaskResult;

JkSmtpSMTPClientTaskResult.NEW = function() {
	var v = new JkSmtpSMTPClientTaskResult;
	return v.CTOR_JkSmtpSMTPClientTaskResult();
};

JkSmtpSMTPClientTaskResult.prototype.CTOR_JkSmtpSMTPClientTaskResult = function() {
	this.status = false;
	this.message = null;
	return this;
};

JkSmtpSMTPClientTaskResult.prototype.getMessage = function() {
	return this.message;
};

JkSmtpSMTPClientTaskResult.prototype.setMessage = function(v) {
	this.message = v;
	return this;
};

JkSmtpSMTPClientTaskResult.prototype.getStatus = function() {
	return this.status;
};

JkSmtpSMTPClientTaskResult.prototype.setStatus = function(v) {
	this.status = v;
	return this;
};

JkSmtpSMTPClientTaskResult.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSmtpSMTPClientTaskResult"] === true;
};

let JkSmtpSMTPClient = function() {};

JkSmtpSMTPClient.prototype._t = { "JkSmtpSMTPClient" : true };
JkSmtpSMTPClient.prototype._tobj = JkSmtpSMTPClient;

JkSmtpSMTPClient.NEW = function() {
	var v = new JkSmtpSMTPClient;
	return v.CTOR_JkSmtpSMTPClient();
};

JkSmtpSMTPClient.prototype.CTOR_JkSmtpSMTPClient = function() {
	return this;
};

JkSmtpSMTPClient.connect = function(server, port, ctx) {
	if(JkLangString.isEmpty(server) || port < 1) {
		return null;
	}
	var address = server;
	var dns = JkDnsDNSResolver.create();
	if(dns != null) {
		address = dns.getIPAddress(server, ctx);
		if(JkLangString.isEmpty(address)) {
			JkLogLog.error(ctx, "SMTPClient: Could not resolve SMTP server address: `" + (JkLangString.safeString(server)) + ("'"));
			return null;
		}
	}
	JkLogLog.debug(ctx, "SMTPClient: Connecting to SMTP server `" + (JkLangString.safeString(address)) + (":") + (JkLangString.safeString((JkLangString.forInteger(port)))) + ("' .."));
	var v = JkSocketTCPSocket.createAndConnect(address, port);
	if(v != null) {
		JkLogLog.debug(ctx, "SMTPClient: Connected to SMTP server `" + (JkLangString.safeString(address)) + (":") + (JkLangString.safeString((JkLangString.forInteger(port)))) + ("' .."));
	}
	else {
		JkLogLog.error(ctx, "SMTPClient: FAILED connection to SMTP server `" + (JkLangString.safeString(address)) + (":") + (JkLangString.safeString((JkLangString.forInteger(port)))) + ("' .."));
	}
	return v;
};

JkSmtpSMTPClient.writeLine = function(ops, str, ctx) {
	var v = ops.print((JkLangString.safeString(str)) + ("\r\n"));
	if(v == false) {
		JkLogLog.error(ctx, "SMTPClient: Failed to write to server: `" + (JkLangString.safeString(str)) + ("'"));
	}
	return v;
};

JkSmtpSMTPClient.communicate = function(ins, expectCode, ctx) {
	var sb = JkLangStringBuilder.NEW();
	var line = ins.readLine();
	if(JkLangString.isEmpty(line) == false) {
		sb.appendString(line);
	}
	while(JkLangString.isEmpty(line) == false && JkLangString.getChar(line, 3) == '-'.charCodeAt()){
		line = ins.readLine();
		if(JkLangString.isEmpty(line) == false) {
			sb.appendString(line);
		}
	}
	if(JkLangString.isEmpty(line) == false && JkLangString.getChar(line, 3) == ' '.charCodeAt()) {
		if(JkLangString.isEmpty(expectCode)) {
			return null;
		}
		var rc = JkLangString.getSubString(line, 0, 3);
		var array = JkLangString.split(expectCode, '|'.charCodeAt(), 0);
		if(array != null) {
			var n = 0;
			var m = array.length;
			for(n = 0 ; n < m ; n++) {
				var cc = array[n];
				if(cc != null) {
					if(JkLangString.equals(cc, rc)) {
						return null;
					}
				}
			}
		}
	}
	var v = sb.toString();
	if(JkLangString.isEmpty(v)) {
		v = "XXX Unknown SMTP server error response";
	}
	JkLogLog.error(ctx, "SMTPClient: Server responded with error status: `" + (JkLangString.safeString(v)) + ("'"));
	return v;
};

JkSmtpSMTPClient.encode = function(enc) {
	if(JkLangString.isEmpty(enc)) {
		return null;
	}
	return JkBase64Base64Encoder.encode((JkLangString.toUTF8Buffer(enc)));
};

JkSmtpSMTPClient.rcptAsEmailAddress = function(ss) {
	if(JkLangString.isEmpty(ss)) {
		return ss;
	}
	var b = JkLangString.getIndexOfCharacter(ss, '<'.charCodeAt(), 0);
	if(b < 0) {
		return ss;
	}
	var e = JkLangString.getIndexOfCharacter(ss, '>'.charCodeAt(), 0);
	if(e < 0) {
		return ss;
	}
	return JkLangString.getSubString(ss, (b + 1), (e - b - 1));
};

JkSmtpSMTPClient.resolveMXServerForDomain = function(domain) {
	var dns = JkDnsDNSResolver.instance();
	if(!(dns != null)) {
		return null;
	}
	var rcs = dns.getNSRecords(domain, "MX", null);
	if(rcs == null || rcs.getSize() < 1) {
		return null;
	}
	var v = null;
	var pr = 0;
	var array = rcs.toVector();
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var mx = (function(o) {
				if(JkDnsDNSRecordMX.IS_INSTANCE && JkDnsDNSRecordMX.IS_INSTANCE(o)) {
					return o;
				}
				return null;
			}.bind(this))(array[n]);
			if(mx != null) {
				var p = mx.getPriority();
				if(v == null || p < pr) {
					pr = p;
					v = mx.getAddress();
				}
			}
		}
	}
	return v;
};

JkSmtpSMTPClient.sendMessage = function(msg, server, serverName, ctx, acceptInvalidCertificate) {
	if(msg == null) {
		return JkSmtpSMTPClientResult.forMessage(msg).addTransaction((JkSmtpSMTPClientTransactionResult.forError("No message")));
	}
	var rcpts = msg.getAllRcpts();
	if(server != null) {
		var t = JkSmtpSMTPClient.executeTransaction(msg, server, rcpts, serverName, ctx, acceptInvalidCertificate);
		if(t != null) {
			t.setServer((server.getHost()));
			t.setRecipients(rcpts);
		}
		return JkSmtpSMTPClientResult.forMessage(msg).addTransaction(t);
	}
	var r = JkSmtpSMTPClientResult.forMessage(msg);
	var servers = JkLangDynamicMap.NEW();
	var array = rcpts.toVector();
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var rcpt = (function(o) {
				if(typeof(o) === 'string') {
					return o;
				}
				return null;
			}.bind(this))(array[n]);
			if(rcpt != null) {
				var em = JkSmtpSMTPClient.rcptAsEmailAddress(rcpt);
				if(JkLangString.isEmpty(em)) {
					r.addTransaction((JkSmtpSMTPClientTransactionResult.forError("Invalid recipient address: `" + (JkLangString.safeString(rcpt)) + ("'"))));
					break;
				}
				var at = JkLangString.getIndexOfCharacter(em, '@'.charCodeAt(), 0);
				if(at < 0) {
					r.addTransaction((JkSmtpSMTPClientTransactionResult.forError("Invalid recipient address: `" + (JkLangString.safeString(rcpt)) + ("'"))));
					break;
				}
				var sa = JkLangString.getEndOfString(em, (at + 1));
				if(JkLangString.isEmpty(sa)) {
					r.addTransaction((JkSmtpSMTPClientTransactionResult.forError("Invalid recipient address: `" + (JkLangString.safeString(rcpt)) + ("'"))));
					break;
				}
				var ss = (function(o1) {
					if(JkLangDynamicVector.IS_INSTANCE && JkLangDynamicVector.IS_INSTANCE(o1)) {
						return o1;
					}
					return null;
				}.bind(this))((servers.get(sa)));
				if(ss == null) {
					ss = JkLangDynamicVector.NEW();
					servers.setObject(sa, ss);
				}
				ss.appendObject(rcpt);
			}
		}
	}
	var itr = servers.iterateKeys();
	while(itr != null){
		var domain = itr.next();
		if(JkLangString.isEmpty(domain)) {
			break;
		}
		var ds = JkSmtpSMTPClient.resolveMXServerForDomain(domain);
		if(JkLangString.isEmpty(ds)) {
			r.addTransaction((JkSmtpSMTPClientTransactionResult.forError("Unable to determine mail server for `" + (JkLangString.safeString(domain)) + ("'"))));
		}
		else {
			JkLogLog.debug(ctx, "SMTP server for domain `" + (JkLangString.safeString(domain)) + ("': `") + (JkLangString.safeString(ds)) + ("'"));
			var trcpts = (function(o2) {
				if(JkLangDynamicVector.IS_INSTANCE && JkLangDynamicVector.IS_INSTANCE(o2)) {
					return o2;
				}
				return null;
			}.bind(this))((servers.get(domain)));
			var t1 = JkSmtpSMTPClient.executeTransaction(msg, (JkUrlURL.forString("smtp://" + (JkLangString.safeString(ds)), false)), trcpts, serverName, ctx, acceptInvalidCertificate);
			if(t1 != null) {
				t1.setDomain(domain);
				t1.setServer(ds);
				t1.setRecipients(trcpts);
			}
			r.addTransaction(t1);
		}
	}
	var vt = r.getTransactions();
	if(vt == null || vt.getSize() < 1) {
		r.addTransaction((JkSmtpSMTPClientTransactionResult.forError("Unknown error in SMTPClient")));
	}
	return r;
};

JkSmtpSMTPClient.executeTransaction = function(msg, server, rcpts, serverName, ctx, acceptInvalidCertificate) {
	var url = server;
	if(url == null) {
		return JkSmtpSMTPClientTransactionResult.forError("No server URL");
	}
	var socket = null;
	var scheme = url.getScheme();
	var host = url.getHost();
	var port = url.getPortInt();
	for(var n = 0 ; n < 3 ; n++) {
		if(JkLangString.equals("smtp", scheme) || JkLangString.equals("smtp+tls", scheme)) {
			if(port < 1) {
				port = 25;
			}
			socket = JkSmtpSMTPClient.connect(host, port, ctx);
		}
		else if(JkLangString.equals("smtp+ssl", scheme)) {
			if(port < 1) {
				port = 465;
			}
			var ts = JkSmtpSMTPClient.connect(host, port, ctx);
			if(ts != null) {
				socket = JkSocketSslSSLSocket.forClient(ts, host, ctx, acceptInvalidCertificate, null);
				if(socket == null) {
					return JkSmtpSMTPClientTransactionResult.forError("Failed to start SSL");
				}
			}
		}
		else {
			return JkSmtpSMTPClientTransactionResult.forError("SMTPClient: Unknown SMTP URI scheme `" + (JkLangString.safeString(scheme)) + ("'"));
		}
		if(socket != null) {
			break;
		}
		JkLogLog.debug(ctx, "Failed to connect to SMTP server `" + (JkLangString.safeString(host)) + (":") + (JkLangString.safeString((JkLangString.forInteger(port)))) + ("'. Waiting to retry .."));
		JkThreadCurrentThread.sleepSeconds(1);
	}
	if(socket == null) {
		return JkSmtpSMTPClientTransactionResult.forError("Unable to connect to SMTP server `" + (JkLangString.safeString(host)) + (":") + (JkLangString.safeString((JkLangString.forInteger(port)))) + ("'"));
	}
	var ops = JkIoPrintWriterWrapper.forWriter(socket);
	var ins = JkIoPrintReader.forReader(socket);
	if(ops == null || ins == null) {
		return JkSmtpSMTPClientTransactionResult.forError("Unable to establish SMTP I/O streams");
	}
	var err = null;
	if(!((err = JkSmtpSMTPClient.communicate(ins, "220", ctx)) == null)) {
		return JkSmtpSMTPClientTransactionResult.forError(err);
	}
	var sn = serverName;
	if(JkLangString.isEmpty(sn)) {
		sn = "smtpclient.jkop";
	}
	if(JkSmtpSMTPClient.writeLine(ops, "EHLO " + (JkLangString.safeString(sn)), ctx) == false) {
		return JkSmtpSMTPClientTransactionResult.forNetworkError();
	}
	if(!((err = JkSmtpSMTPClient.communicate(ins, "250", ctx)) == null)) {
		return JkSmtpSMTPClientTransactionResult.forError(err);
	}
	if(JkLangString.equals("smtp+tls", scheme)) {
		if(JkSmtpSMTPClient.writeLine(ops, "STARTTLS", ctx) == false) {
			return JkSmtpSMTPClientTransactionResult.forNetworkError();
		}
		if(!((err = JkSmtpSMTPClient.communicate(ins, "220", ctx)) == null)) {
			return JkSmtpSMTPClientTransactionResult.forError(err);
		}
		ops = null;
		ins = null;
		socket = JkSocketSslSSLSocket.forClient(socket, host, ctx, acceptInvalidCertificate, null);
		if(socket == null) {
			return JkSmtpSMTPClientTransactionResult.forError("Failed to start SSL");
		}
		ops = JkIoPrintWriterWrapper.forWriter(socket);
		ins = JkIoPrintReader.forReader(socket);
		if(JkSmtpSMTPClient.writeLine(ops, "EHLO " + (JkLangString.safeString(sn)), ctx) == false) {
			return JkSmtpSMTPClientTransactionResult.forNetworkError();
		}
		if(!((err = JkSmtpSMTPClient.communicate(ins, "250", ctx)) == null)) {
			return JkSmtpSMTPClientTransactionResult.forError(err);
		}
	}
	var username = url.getUsername();
	var password = url.getPassword();
	if(JkLangString.isEmpty(username) == false) {
		if(JkSmtpSMTPClient.writeLine(ops, "AUTH login", ctx) == false) {
			return JkSmtpSMTPClientTransactionResult.forNetworkError();
		}
		if(!((err = JkSmtpSMTPClient.communicate(ins, "334", ctx)) == null)) {
			return JkSmtpSMTPClientTransactionResult.forError(err);
		}
		if(JkSmtpSMTPClient.writeLine(ops, (JkSmtpSMTPClient.encode(username)), ctx) == false) {
			return JkSmtpSMTPClientTransactionResult.forNetworkError();
		}
		if(!((err = JkSmtpSMTPClient.communicate(ins, "334", ctx)) == null)) {
			return JkSmtpSMTPClientTransactionResult.forError(err);
		}
		if(JkSmtpSMTPClient.writeLine(ops, (JkSmtpSMTPClient.encode(password)), ctx) == false) {
			return JkSmtpSMTPClientTransactionResult.forNetworkError();
		}
		if(!((err = JkSmtpSMTPClient.communicate(ins, "235|530", ctx)) == null)) {
			return JkSmtpSMTPClientTransactionResult.forError(err);
		}
	}
	if(JkSmtpSMTPClient.writeLine(ops, "MAIL FROM:<" + (JkLangString.safeString((msg.getMyAddress()))) + (">"), ctx) == false) {
		return JkSmtpSMTPClientTransactionResult.forNetworkError();
	}
	if(!((err = JkSmtpSMTPClient.communicate(ins, "250", ctx)) == null)) {
		return JkSmtpSMTPClientTransactionResult.forError(err);
	}
	if(rcpts != null) {
		var array = rcpts.toVector();
		if(array != null) {
			var n2 = 0;
			var m = array.length;
			for(n2 = 0 ; n2 < m ; n2++) {
				var rcpt = (function(o) {
					if(typeof(o) === 'string') {
						return o;
					}
					return null;
				}.bind(this))(array[n2]);
				if(rcpt != null) {
					if(JkSmtpSMTPClient.writeLine(ops, "RCPT TO:<" + (JkLangString.safeString((JkSmtpSMTPClient.rcptAsEmailAddress(rcpt)))) + (">"), ctx) == false) {
						return JkSmtpSMTPClientTransactionResult.forNetworkError();
					}
					if(!((err = JkSmtpSMTPClient.communicate(ins, "250", ctx)) == null)) {
						return JkSmtpSMTPClientTransactionResult.forError(err);
					}
				}
			}
		}
	}
	if(JkSmtpSMTPClient.writeLine(ops, "DATA", ctx) == false) {
		return JkSmtpSMTPClientTransactionResult.forNetworkError();
	}
	if(!((err = JkSmtpSMTPClient.communicate(ins, "354", ctx)) == null)) {
		return JkSmtpSMTPClientTransactionResult.forError(err);
	}
	if(JkLangString.isEmpty((msg.getMessageID()))) {
		msg.generateMessageID(sn);
	}
	var bod = msg.getMessageBody();
	JkLogLog.debug(ctx, "Sending message body: `" + (JkLangString.safeString(bod)) + ("'"));
	if(ops.print(bod) == false) {
		return JkSmtpSMTPClientTransactionResult.forNetworkError();
	}
	if(ops.print("\r\n.\r\n") == false) {
		return JkSmtpSMTPClientTransactionResult.forNetworkError();
	}
	if(!((err = JkSmtpSMTPClient.communicate(ins, "250", ctx)) == null)) {
		return JkSmtpSMTPClientTransactionResult.forError(err);
	}
	if(JkSmtpSMTPClient.writeLine(ops, "QUIT", ctx) == false) {
		return JkSmtpSMTPClientTransactionResult.forNetworkError();
	}
	return JkSmtpSMTPClientTransactionResult.forSuccess();
};

JkSmtpSMTPClient.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSmtpSMTPClient"] === true;
};

let JkSmtpSMTPMultipartMessage = function() {
	JkSmtpSMTPMessage.call(this);
	this.attachments = null;
	this.message = null;
};

JkSmtpSMTPMultipartMessage.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkSmtpSMTPMessage.prototype);
JkSmtpSMTPMultipartMessage.prototype.constructor = JkSmtpSMTPMultipartMessage;
JkSmtpSMTPMultipartMessage.prototype._t = {
	"JkSmtpSMTPMessage" : true,
	"JkSmtpSMTPMultipartMessage" : true
};
JkSmtpSMTPMultipartMessage.prototype._tobj = JkSmtpSMTPMultipartMessage;

JkSmtpSMTPMultipartMessage.NEW = function() {
	var v = new JkSmtpSMTPMultipartMessage;
	return v.CTOR_JkSmtpSMTPMultipartMessage();
};

JkSmtpSMTPMultipartMessage.prototype.CTOR_JkSmtpSMTPMultipartMessage = function() {
	if(JkSmtpSMTPMessage.prototype.CTOR_JkSmtpSMTPMessage.call(this) == null) {
		return null;
	}
	this.message = null;
	this.attachments = null;
	this.setContentType("multipart/mixed");
	return this;
};

JkSmtpSMTPMultipartMessage.prototype.getMessageBody = function() {
	if(this.attachments == null || this.attachments.getSize() < 1) {
		return null;
	}
	if(JkLangString.isEmpty(this.message) == false) {
		return this.message;
	}
	var subject = this.getSubject();
	var date = this.getDate();
	var myName = this.getMyName();
	var myAddress = this.getMyAddress();
	var text = this.getText();
	var recipientsTo = this.getRcptsTo();
	var recipientsCC = this.getRcptsCC();
	var messageID = this.getMessageID();
	var replyTo = this.getReplyTo();
	var sb = JkLangStringBuilder.NEW();
	sb.appendString("From: ");
	sb.appendString(myName);
	sb.appendString(" <");
	sb.appendString(myAddress);
	if(JkLangString.isEmpty(replyTo) == false) {
		sb.appendString(">\r\nReply-To: ");
		sb.appendString(myName);
		sb.appendString(" <");
		sb.appendString(replyTo);
	}
	sb.appendString(">\r\nTo: ");
	var first = true;
	if(recipientsTo != null) {
		var array = recipientsTo.toVector();
		if(array != null) {
			var n = 0;
			var m = array.length;
			for(n = 0 ; n < m ; n++) {
				var to = (function(o) {
					if(typeof(o) === 'string') {
						return o;
					}
					return null;
				}.bind(this))(array[n]);
				if(to != null) {
					if(first == false) {
						sb.appendString(", ");
					}
					sb.appendString(to);
					first = false;
				}
			}
		}
	}
	sb.appendString("\r\nCc: ");
	first = true;
	if(recipientsCC != null) {
		var array2 = recipientsCC.toVector();
		if(array2 != null) {
			var n2 = 0;
			var m2 = array2.length;
			for(n2 = 0 ; n2 < m2 ; n2++) {
				var to1 = (function(o1) {
					if(typeof(o1) === 'string') {
						return o1;
					}
					return null;
				}.bind(this))(array2[n2]);
				if(to1 != null) {
					if(first == false) {
						sb.appendString(", ");
					}
					sb.appendString(to1);
					first = false;
				}
			}
		}
	}
	sb.appendString("\r\nSubject: ");
	sb.appendString(subject);
	sb.appendString("\r\nMIME-Version: 1.0");
	sb.appendString("\r\nContent-Type: ");
	sb.appendString("multipart/mixed");
	sb.appendString("; boundary=\"XXXXboundarytext\"");
	sb.appendString("\r\nDate: ");
	sb.appendString(date);
	sb.appendString("\r\nMessage-ID: <");
	sb.appendString(messageID);
	sb.appendString(">\r\n\r\n");
	sb.appendString("This is a multipart message in MIME format.");
	sb.appendString("\r\n");
	sb.appendString("\r\n--XXXXboundarytext");
	sb.appendString("\r\nContent-Type: text/plain");
	sb.appendString("\r\n");
	sb.appendString("\r\n");
	sb.appendString(text);
	var array3 = this.attachments.toVector();
	if(array3 != null) {
		var n3 = 0;
		var m3 = array3.length;
		for(n3 = 0 ; n3 < m3 ; n3++) {
			var file = (function(o2) {
				if(JkFsFile.IS_INSTANCE && JkFsFile.IS_INSTANCE(o2)) {
					return o2;
				}
				return null;
			}.bind(this))(array3[n3]);
			if(file != null) {
				sb.appendString("\r\n--XXXXboundarytext");
				sb.appendString("\r\nContent-Type: ");
				var contentType = JkMimeMimeTypeRegistry.getSharedInstance().getTypeForFile(file);
				if(JkLangString.isEmpty(contentType) == false && JkLangString.getIndexOfString(contentType, "text", 0) == 0) {
					sb.appendString(contentType);
					sb.appendString("\r\nContent-Disposition: attachment; filename=");
					sb.appendString((file.getBasename()));
					sb.appendString("\r\n");
					sb.appendString("\r\n");
					sb.appendString((file.getContentsUTF8()));
				}
				else {
					sb.appendString(contentType);
					sb.appendString("\r\nContent-Transfer-Encoding: Base64");
					sb.appendString("\r\nContent-Disposition: attachment filename=");
					sb.appendString((file.getBasename()));
					sb.appendString("\r\n");
					sb.appendString("\r\n");
					sb.appendString((JkBase64Base64Encoder.encode((file.getContentsBuffer()))));
				}
			}
		}
	}
	sb.appendString("\r\n");
	sb.appendString("\r\n--XXXXboundarytext--");
	return this.message = sb.toString();
};

JkSmtpSMTPMultipartMessage.prototype.getAttachments = function() {
	return this.attachments;
};

JkSmtpSMTPMultipartMessage.prototype.setAttachments = function(v) {
	this.attachments = v;
	return this;
};

JkSmtpSMTPMultipartMessage.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSmtpSMTPMultipartMessage"] === true;
};

let JkSmtpSMTPClientTask = function() {
	this.ctx = null;
	this.server = null;
	this.msg = null;
	this.serverAddress = null;
	this.listener = null;
	this.sender = null;
	this.acceptInvalidCertificate = false;
};

JkSmtpSMTPClientTask.prototype._t = {
	"JkSmtpSMTPClientTask" : true,
	"JkLangRunnable" : true
};
JkSmtpSMTPClientTask.prototype._tobj = JkSmtpSMTPClientTask;

JkSmtpSMTPClientTask.NEW = function() {
	var v = new JkSmtpSMTPClientTask;
	return v.CTOR_JkSmtpSMTPClientTask();
};

JkSmtpSMTPClientTask.prototype.CTOR_JkSmtpSMTPClientTask = function() {
	this.acceptInvalidCertificate = false;
	this.sender = null;
	this.listener = null;
	this.serverAddress = null;
	this.msg = null;
	this.server = null;
	this.ctx = null;
	return this;
};

JkSmtpSMTPClientTask.prototype.run = function() {
	var r = null;
	if(this.msg == null) {
		r = JkSmtpSMTPClientResult.forError("No message was given to SMTPClientTask", this.msg);
	}
	else {
		r = JkSmtpSMTPClient.sendMessage(this.msg, this.server, this.serverAddress, this.ctx, this.acceptInvalidCertificate);
	}
	if(r == null) {
		r = JkSmtpSMTPClientResult.forError("Unknown error", this.msg);
	}
	if(this.sender != null) {
		this.sender.onSendEnd();
	}
	if(this.listener == null) {
		return;
	}
	this.listener.onSMTPSendComplete((r.getMessage()), r);
};

JkSmtpSMTPClientTask.prototype.getCtx = function() {
	return this.ctx;
};

JkSmtpSMTPClientTask.prototype.setCtx = function(v) {
	this.ctx = v;
	return this;
};

JkSmtpSMTPClientTask.prototype.getServer = function() {
	return this.server;
};

JkSmtpSMTPClientTask.prototype.setServer = function(v) {
	this.server = v;
	return this;
};

JkSmtpSMTPClientTask.prototype.getMsg = function() {
	return this.msg;
};

JkSmtpSMTPClientTask.prototype.setMsg = function(v) {
	this.msg = v;
	return this;
};

JkSmtpSMTPClientTask.prototype.getServerAddress = function() {
	return this.serverAddress;
};

JkSmtpSMTPClientTask.prototype.setServerAddress = function(v) {
	this.serverAddress = v;
	return this;
};

JkSmtpSMTPClientTask.prototype.getListener = function() {
	return this.listener;
};

JkSmtpSMTPClientTask.prototype.setListener = function(v) {
	this.listener = v;
	return this;
};

JkSmtpSMTPClientTask.prototype.getSender = function() {
	return this.sender;
};

JkSmtpSMTPClientTask.prototype.setSender = function(v) {
	this.sender = v;
	return this;
};

JkSmtpSMTPClientTask.prototype.getAcceptInvalidCertificate = function() {
	return this.acceptInvalidCertificate;
};

JkSmtpSMTPClientTask.prototype.setAcceptInvalidCertificate = function(v) {
	this.acceptInvalidCertificate = v;
	return this;
};

JkSmtpSMTPClientTask.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSmtpSMTPClientTask"] === true;
};

let JkSmtpSMTPSenderListener = {};

JkSmtpSMTPSenderListener.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSmtpSMTPSenderListener"] === true;
};

let JkSmtpSMTPClientResult = function() {
	this.message = null;
	this.transactions = null;
};

JkSmtpSMTPClientResult.prototype._t = { "JkSmtpSMTPClientResult" : true };
JkSmtpSMTPClientResult.prototype._tobj = JkSmtpSMTPClientResult;

JkSmtpSMTPClientResult.NEW = function() {
	var v = new JkSmtpSMTPClientResult;
	return v.CTOR_JkSmtpSMTPClientResult();
};

JkSmtpSMTPClientResult.prototype.CTOR_JkSmtpSMTPClientResult = function() {
	this.transactions = null;
	this.message = null;
	return this;
};

JkSmtpSMTPClientResult.forSuccess = function() {
	return JkSmtpSMTPClientResult.NEW();
};

JkSmtpSMTPClientResult.forMessage = function(msg) {
	return JkSmtpSMTPClientResult.NEW().setMessage(msg);
};

JkSmtpSMTPClientResult.forError = function(error, msg) {
	return JkSmtpSMTPClientResult.NEW().setMessage(msg).addTransaction((JkSmtpSMTPClientTransactionResult.forError(error)));
};

JkSmtpSMTPClientResult.prototype.getStatus = function() {
	if(!(this.transactions != null)) {
		return false;
	}
	var array = this.transactions.toVector();
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var rr = (function(o) {
				if(JkSmtpSMTPClientTransactionResult.IS_INSTANCE && JkSmtpSMTPClientTransactionResult.IS_INSTANCE(o)) {
					return o;
				}
				return null;
			}.bind(this))(array[n]);
			if(rr != null) {
				if(rr.getStatus() == false) {
					return false;
				}
			}
		}
	}
	return true;
};

JkSmtpSMTPClientResult.prototype.addTransaction = function(r) {
	if(r == null) {
		return this;
	}
	if(this.transactions == null) {
		this.transactions = JkLangDynamicVector.NEW();
	}
	this.transactions.appendObject(r);
	return this;
};

JkSmtpSMTPClientResult.prototype.getMessage = function() {
	return this.message;
};

JkSmtpSMTPClientResult.prototype.setMessage = function(v) {
	this.message = v;
	return this;
};

JkSmtpSMTPClientResult.prototype.getTransactions = function() {
	return this.transactions;
};

JkSmtpSMTPClientResult.prototype.setTransactions = function(v) {
	this.transactions = v;
	return this;
};

JkSmtpSMTPClientResult.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSmtpSMTPClientResult"] === true;
};
