let JkTimeFormatVerboseDateTimeString = function() {};

JkTimeFormatVerboseDateTimeString.prototype._t = { "JkTimeFormatVerboseDateTimeString" : true };
JkTimeFormatVerboseDateTimeString.prototype._tobj = JkTimeFormatVerboseDateTimeString;

JkTimeFormatVerboseDateTimeString.NEW = function() {
	var v = new JkTimeFormatVerboseDateTimeString;
	return v.CTOR_JkTimeFormatVerboseDateTimeString();
};

JkTimeFormatVerboseDateTimeString.prototype.CTOR_JkTimeFormatVerboseDateTimeString = function() {
	return this;
};

JkTimeFormatVerboseDateTimeString.forUTCNow = function() {
	return JkTimeFormatVerboseDateTimeString.forDateTime((JkTimeSystemClock.asDateTimeUTC()));
};

JkTimeFormatVerboseDateTimeString.forNow = function() {
	return JkTimeFormatVerboseDateTimeString.forDateTime((JkTimeSystemClock.asDateTimeLocal()));
};

JkTimeFormatVerboseDateTimeString.forDateTime = function(dd) {
	if(!(dd != null)) {
		return "NODATE";
	}
	var sb = JkLangStringBuilder.NEW();
	sb.appendString((JkTimeFormatVerboseDateTimeString.getShortDayName((dd.getWeekDay()))));
	sb.appendString(", ");
	sb.appendString((JkLangString.forInteger((dd.getDayOfMonth()))));
	sb.appendCharacter(' '.charCodeAt());
	sb.appendString((JkTimeFormatVerboseDateTimeString.getShortMonthName((dd.getMonth()))));
	sb.appendCharacter(' '.charCodeAt());
	sb.appendString((JkLangString.forInteger((dd.getYear()))));
	sb.appendCharacter(' '.charCodeAt());
	sb.appendString((JkLangString.forIntegerWithPadding((dd.getHours()), 2, "0")));
	sb.appendCharacter(':'.charCodeAt());
	sb.appendString((JkLangString.forIntegerWithPadding((dd.getMinutes()), 2, "0")));
	sb.appendCharacter(':'.charCodeAt());
	sb.appendString((JkLangString.forIntegerWithPadding((dd.getSeconds()), 2, "0")));
	var offset = dd.getTimezoneOffset();
	if(offset == 0) {
		sb.appendString(" +0000");
	}
	else {
		var hr = ~(~(offset / 3600));
		var mm = ~(~((offset - hr * 3600) / 60));
		if(hr <= 0) {
			sb.appendString(" +");
			hr = -hr;
		}
		else {
			sb.appendString(" -");
		}
		sb.appendString((JkLangString.forIntegerWithPadding(hr, 2, "0")));
		sb.appendString((JkLangString.forIntegerWithPadding(mm, 2, "0")));
	}
	return sb.toString();
};

JkTimeFormatVerboseDateTimeString.getTimeStringForDateTime = function(dd, includeTimeZone) {
	if(!(dd != null)) {
		return "NOTIME";
	}
	var sb = JkLangStringBuilder.NEW();
	sb.appendString((JkLangString.forIntegerWithPadding((dd.getHours()), 2, "0")));
	sb.appendCharacter(':'.charCodeAt());
	sb.appendString((JkLangString.forIntegerWithPadding((dd.getMinutes()), 2, "0")));
	sb.appendCharacter(':'.charCodeAt());
	sb.appendString((JkLangString.forIntegerWithPadding((dd.getSeconds()), 2, "0")));
	if(includeTimeZone) {
		sb.appendString(" GMT");
	}
	return sb.toString();
};

JkTimeFormatVerboseDateTimeString.getDateStringForDateTime = function(dd) {
	if(!(dd != null)) {
		return "NODATE";
	}
	var sb = JkLangStringBuilder.NEW();
	sb.appendString((JkTimeFormatVerboseDateTimeString.getLongMonthName((dd.getMonth()))));
	sb.appendCharacter(' '.charCodeAt());
	sb.appendString((JkLangString.forInteger((dd.getDayOfMonth()))));
	sb.appendString(", ");
	sb.appendString((JkLangString.forInteger((dd.getYear()))));
	return sb.toString();
};

JkTimeFormatVerboseDateTimeString.getShortDayName = function(n) {
	switch(n) {
		case 1:
			return "Sun";
		case 2:
			return "Mon";
		case 3:
			return "Tue";
		case 4:
			return "Wed";
		case 5:
			return "Thu";
		case 6:
			return "Fri";
		case 7:
			return "Sat";
	}
	return null;
};

JkTimeFormatVerboseDateTimeString.getLongDayName = function(n) {
	switch(n) {
		case 1:
			return "Sunday";
		case 2:
			return "Monday";
		case 3:
			return "Tuesday";
		case 4:
			return "Wednesday";
		case 5:
			return "Thursday";
		case 6:
			return "Friday";
		case 7:
			return "Saturday";
	}
	return null;
};

JkTimeFormatVerboseDateTimeString.getShortMonthName = function(n) {
	switch(n) {
		case 1:
			return "Jan";
		case 2:
			return "Feb";
		case 3:
			return "Mar";
		case 4:
			return "Apr";
		case 5:
			return "May";
		case 6:
			return "Jun";
		case 7:
			return "Jul";
		case 8:
			return "Aug";
		case 9:
			return "Sep";
		case 10:
			return "Oct";
		case 11:
			return "Nov";
		case 12:
			return "Dec";
	}
	return null;
};

JkTimeFormatVerboseDateTimeString.getLongMonthName = function(n) {
	switch(n) {
		case 1:
			return "January";
		case 2:
			return "February";
		case 3:
			return "March";
		case 4:
			return "April";
		case 5:
			return "May";
		case 6:
			return "June";
		case 7:
			return "July";
		case 8:
			return "August";
		case 9:
			return "September";
		case 10:
			return "October";
		case 11:
			return "November";
		case 12:
			return "December";
	}
	return null;
};

JkTimeFormatVerboseDateTimeString.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkTimeFormatVerboseDateTimeString"] === true;
};
