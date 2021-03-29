jk = jk or {}

jk.mime = jk.mime or {}

jk.mime.MimeTypeRegistry = {}
jk.mime.MimeTypeRegistry.__index = jk.mime.MimeTypeRegistry
_vm:set_metatable(jk.mime.MimeTypeRegistry, {})

jk.mime.MimeTypeRegistry.sharedInstance = nil

function jk.mime.MimeTypeRegistry._create()
	local v = _vm:set_metatable({}, jk.mime.MimeTypeRegistry)
	return v
end

function jk.mime.MimeTypeRegistry:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mime.MimeTypeRegistry'
	self['_isType.jk.mime.MimeTypeRegistry'] = true
	self.htMime = nil
	self.htExt = nil
end

function jk.mime.MimeTypeRegistry:getSharedInstance()
	if not (_g.jk.mime.MimeTypeRegistry.sharedInstance ~= nil) then
		_g.jk.mime.MimeTypeRegistry.sharedInstance = _g.jk.mime.MimeTypeRegistry._construct0(_g.jk.mime.MimeTypeRegistry._create())
	end
	do return _g.jk.mime.MimeTypeRegistry.sharedInstance end
end

function jk.mime.MimeTypeRegistry:_construct0()
	jk.mime.MimeTypeRegistry._init(self)
	self.htMime = {}
	self.htExt = {}
	do self:addBuiltinTypes() end
	return self
end

function jk.mime.MimeTypeRegistry:addBuiltinTypes()
	do self:add("*.cpp", "text/x-c++src") end
	do self:add("*.ogm", "video/x-ogm+ogg") end
	do self:add("*.epsf", "image/x-eps") end
	do self:add("*.mpeg", "video/mpeg") end
	do self:add("*.rmj", "application/vnd.rn-realmedia") end
	do self:add("*.nes", "application/x-nes-rom") end
	do self:add("*.rmm", "application/vnd.rn-realmedia") end
	do self:add("*.gb", "application/x-gameboy-rom") end
	do self:add("*.qtvr", "video/quicktime") end
	do self:add("*.ogv", "video/ogg") end
	do self:add("*.amr", "audio/AMR") end
	do self:add("*.ogx", "application/ogg") end
	do self:add("*.rms", "application/vnd.rn-realmedia") end
	do self:add("*.gf", "application/x-tex-gf") end
	do self:add("*.gg", "application/x-sms-rom") end
	do self:add("*.xslt", "application/xml") end
	do self:add("*.Z", "application/x-compress") end
	do self:add("*.mdb", "application/vnd.ms-access") end
	do self:add("*.rmx", "application/vnd.rn-realmedia") end
	do self:add("*.anim[1-9j]", "video/x-anim") end
	do self:add("*.gp", "application/x-gnuplot") end
	do self:add("*.a", "application/x-archive") end
	do self:add("*.a", "application/x-shared-library-la") end
	do self:add("*.mdi", "image/vnd.ms-modi") end
	do self:add("*.c", "text/x-csrc") end
	do self:add("*.gv", "text/vnd.graphviz") end
	do self:add("*.m3u8", "audio/x-mpegurl") end
	do self:add("*.e", "text/x-eiffel") end
	do self:add("*.pict1", "image/x-pict") end
	do self:add("*.pict2", "image/x-pict") end
	do self:add("*.spd", "application/x-font-speedo") end
	do self:add("*.spc", "application/x-pkcs7-certificates") end
	do self:add("*.gz", "application/x-gzip") end
	do self:add("*.dtd", "application/xml-dtd") end
	do self:add("*.dvi.gz", "application/x-gzdvi") end
	do self:add("*.h", "text/x-chdr") end
	do self:add("*.o", "application/x-object") end
	do self:add("*.spl", "application/x-shockwave-flash") end
	do self:add("*.etheme", "application/x-e-theme") end
	do self:add("*.d", "text/x-dsrc") end
	do self:add("*.sr2", "image/x-sony-sr2") end
	do self:add("*.t", "text/troff") end
	do self:add("*.hh", "text/x-c++hdr") end
	do self:add("*.m", "text/x-objcsrc") end
	do self:add("*.m", "text/x-matlab") end
	do self:add("*.ps.bz2", "application/x-bzpostscript") end
	do self:add("*.anx", "application/annodex") end
	do self:add("*.crt", "application/x-x509-ca-cert") end
	do self:add("*.med", "audio/x-mod") end
	do self:add("*.crw", "image/x-canon-crw") end
	do self:add("*.spx", "audio/ogg") end
	do self:add("*.spx", "audio/x-speex") end
	do self:add("*.xliff", "application/x-xliff") end
	do self:add("*.ani", "application/x-navi-animation") end
	do self:add("*.hp", "text/x-c++hdr") end
	do self:add("*.vhdl", "text/x-vhdl") end
	do self:add("*.f", "text/x-fortran") end
	do self:add("*.hs", "text/x-haskell") end
	do self:add("*.epub", "application/epub+zip") end
	do self:add("*.kar", "audio/midi") end
	do self:add("*.mpga", "audio/mpeg") end
	do self:add("*.dtx", "text/x-tex") end
	do self:add("*.pptx", "application/vnd.openxmlformats-officedocument.presentationml.presentation") end
	do self:add("*.dsl", "text/x-dsl") end
	do self:add("*.csh", "application/x-csh") end
	do self:add("*.nfo", "text/x-nfo") end
	do self:add("*.pkr", "application/pgp-keys") end
	do self:add("*.epsi.bz2", "image/x-bzeps") end
	do self:add("*.spec", "text/x-rpm-spec") end
	do self:add("*.f90", "text/x-fortran") end
	do self:add("*.sql", "text/x-sql") end
	do self:add("*.css", "text/css") end
	do self:add("*.f95", "text/x-fortran") end
	do self:add("*.csv", "text/csv") end
	do self:add("*.epsi", "image/x-eps") end
	do self:add("*.tsv", "text/tab-separated-values") end
	do self:add("*.pla", "audio/x-iriver-pla") end
	do self:add("*.it", "audio/x-it") end
	do self:add("*.ape", "audio/x-ape") end
	do self:add("*.src", "application/x-wais-source") end
	do self:add("*.tta", "audio/x-tta") end
	do self:add("*.ttc", "application/x-font-ttf") end
	do self:add("*.srf", "image/x-sony-srf") end
	do self:add("*.pln", "application/x-planperfect") end
	do self:add("*.ttf", "application/x-font-ttf") end
	do self:add("*.exe", "application/x-ms-dos-executable") end
	do self:add("*.abw.gz", "application/x-abiword") end
	do self:add("*.chrt", "application/x-kchart") end
	do self:add("*.dvi", "application/x-dvi") end
	do self:add("*.rpm", "application/x-rpm") end
	do self:add("*.epsf.gz", "image/x-gzeps") end
	do self:add("*.pls", "audio/x-scpls") end
	do self:add("*.gcrd", "text/directory") end
	do self:add("*.t2t", "text/x-txt2tags") end
	do self:add("*.srt", "application/x-subrip") end
	do self:add("*.exr", "image/x-exr") end
	do self:add("*.pntg", "image/x-macpaint") end
	do self:add("*.ttx", "application/x-font-ttx") end
	do self:add("*.jad", "text/vnd.sun.j2me.app-descriptor") end
	do self:add("*.js", "application/javascript") end
	do self:add("*.latex", "text/x-tex") end
	do self:add("*.jar", "application/x-java-archive") end
	do self:add("*.ssa", "text/x-ssa") end
	do self:add("*.xspf", "application/xspf+xml") end
	do self:add("*.mgp", "application/x-magicpoint") end
	do self:add("*.movie", "video/x-sgi-movie") end
	do self:add("*.cue", "application/x-cue") end
	do self:add("*.html", "text/html") end
	do self:add("*.smaf", "application/x-smaf") end
	do self:add("*.zabw", "application/x-abiword") end
	do self:add("*.dwg", "image/vnd.dwg") end
	do self:add("authors", "text/x-authors") end
	do self:add("*.msod", "image/x-msod") end
	do self:add("*.xslfo", "text/x-xslfo") end
	do self:add("*.mrml", "text/x-mrml") end
	do self:add("*.kdc", "image/x-kodak-kdc") end
	do self:add("*.cur", "image/x-win-bitmap") end
	do self:add("*.gnucash", "application/x-gnucash") end
	do self:add("*.pkipath", "application/pkix-pkipath") end
	do self:add("*.p", "text/x-pascal") end
	do self:add("*.patch", "text/x-patch") end
	do self:add("*.old", "application/x-trash") end
	do self:add("*.m4", "application/x-m4") end
	do self:add("*.mbox", "application/mbox") end
	do self:add("*.png", "image/png") end
	do self:add("*.stc", "application/vnd.sun.xml.calc.template") end
	do self:add("*.std", "application/vnd.sun.xml.draw.template") end
	do self:add("*.arj", "application/x-arj") end
	do self:add("*.pnm", "image/x-portable-anymap") end
	do self:add("*.dxf", "image/vnd.dxf") end
	do self:add("*.sti", "application/vnd.sun.xml.impress.template") end
	do self:add("*.gplt", "application/x-gnuplot") end
	do self:add("*.la", "application/x-shared-library-la") end
	do self:add("*.stm", "audio/x-stm") end
	do self:add("*.pcf.gz", "application/x-font-pcf") end
	do self:add("*.kexic", "application/x-kexi-connectiondata") end
	do self:add("*.arw", "image/x-sony-arw") end
	do self:add("*.mid", "audio/midi") end
	do self:add("*.stw", "application/vnd.sun.xml.writer.template") end
	do self:add("*.mif", "application/x-mif") end
	do self:add("*.sty", "text/x-tex") end
	do self:add("*.hpgl", "application/vnd.hp-hpgl") end
	do self:add("*.asc", "application/pgp-encrypted") end
	do self:add("*.asc", "application/pgp-keys") end
	do self:add("*.asc", "text/plain") end
	do self:add("*.sub", "text/x-microdvd") end
	do self:add("*.sub", "text/x-mpsub") end
	do self:add("*.sub", "text/x-subviewer") end
	do self:add("*.ly", "text/x-lilypond") end
	do self:add("*.lz", "application/x-lzip") end
	do self:add("*.kexis", "application/x-kexiproject-shortcut") end
	do self:add("*.asf", "video/x-ms-asf") end
	do self:add("*.wmls", "text/vnd.wap.wmlscript") end
	do self:add("*.s3m", "audio/x-s3m") end
	do self:add("*.por", "application/x-spss-por") end
	do self:add("*.asp", "application/x-asp") end
	do self:add("*.aspx", "application/x-asp") end
	do self:add("*.ashx", "application/x-asp") end
	do self:add("*.pot", "application/vnd.ms-powerpoint") end
	do self:add("*.pot", "text/x-gettext-translation-template") end
	do self:add("*.sun", "image/x-sun-raster") end
	do self:add("*.ass", "text/x-ssa") end
	do self:add("*.rss", "application/rss+xml") end
	do self:add("*.lha", "application/x-lha") end
	do self:add("*.md", "application/x-genesis-rom") end
	do self:add("*.me", "text/x-troff-me") end
	do self:add("*.sami", "application/x-sami") end
	do self:add("*.asx", "audio/x-ms-asx") end
	do self:add("*.mm", "text/x-troff-mm") end
	do self:add("*.mo", "application/x-gettext-translation") end
	do self:add("CMakeLists.txt", "text/x-cmake") end
	do self:add("*.ml", "text/x-ocaml") end
	do self:add("*.ms", "text/x-troff-ms") end
	do self:add("*.kfo", "application/x-kformula") end
	do self:add("*.rtf", "application/rtf") end
	do self:add("*.lhs", "text/x-literate-haskell") end
	do self:add("*.svg", "image/svg+xml") end
	do self:add("*.ppm", "image/x-portable-pixmap") end
	do self:add("*.nb", "application/mathematica") end
	do self:add("*.lhz", "application/x-lhz") end
	do self:add("*.pps", "application/vnd.ms-powerpoint") end
	do self:add("*.ppt", "application/vnd.ms-powerpoint") end
	do self:add("*.nc", "application/x-netcdf") end
	do self:add("*.icb", "image/x-tga") end
	do self:add("*.ica", "application/x-ica") end
	do self:add("*.mka", "audio/x-matroska") end
	do self:add("*.ppz", "application/vnd.ms-powerpoint") end
	do self:add("*.txt", "text/plain") end
	do self:add("*.rtx", "text/richtext") end
	do self:add("*.gedcom", "application/x-gedcom") end
	do self:add("*.cxx", "text/x-c++src") end
	do self:add("*.ico", "image/vnd.microsoft.icon") end
	do self:add("*.metalink", "application/metalink+xml") end
	do self:add("*.txz", "application/x-xz-compressed-tar") end
	do self:add("*.ics", "text/calendar") end
	do self:add("*.p10", "application/pkcs10") end
	do self:add("gnumakefile", "text/x-makefile") end
	do self:add("*.p12", "application/x-pkcs12") end
	do self:add("*.swf", "application/x-shockwave-flash") end
	do self:add("*.mkv", "video/x-matroska") end
	do self:add("*.idl", "text/x-idl") end
	do self:add("*.prc", "application/x-palm-database") end
	do self:add("*.mli", "text/x-ocaml") end
	do self:add("*.tar.lzo", "application/x-tzo") end
	do self:add("*.sxc", "application/vnd.sun.xml.calc") end
	do self:add("*.sxd", "application/vnd.sun.xml.draw") end
	do self:add("*.cert", "application/x-x509-ca-cert") end
	do self:add("*.avi", "video/x-msvideo") end
	do self:add("*.sxg", "application/vnd.sun.xml.writer.global") end
	do self:add("*.qtl", "application/x-quicktime-media-link") end
	do self:add("*.sxi", "application/vnd.sun.xml.impress") end
	do self:add("*.xac", "application/x-gnucash") end
	do self:add("*.djvu", "image/vnd.djvu") end
	do self:add("*.sxm", "application/vnd.sun.xml.math") end
	do self:add("winmail.dat", "application/vnd.ms-tnef") end
	do self:add("*.bz2", "application/x-bzip") end
	do self:add("*.ief", "image/ief") end
	do self:add("*.tzo", "application/x-tzo") end
	do self:add("*.pk", "application/x-tex-pk") end
	do self:add("*.pl", "application/x-perl") end
	do self:add("*.rvx", "video/vnd.rn-realvideo") end
	do self:add("*.sxw", "application/vnd.sun.xml.writer") end
	do self:add("*.php4", "application/x-php") end
	do self:add("*.mmf", "application/x-smaf") end
	do self:add("*.BLEND", "application/x-blender") end
	do self:add("*.kil", "application/x-killustrator") end
	do self:add("*.pm", "application/x-perl") end
	do self:add("*.ps", "application/postscript") end
	do self:add("*.awb", "audio/AMR-WB") end
	do self:add("*.psf", "application/x-font-linux-psf") end
	do self:add("*.psf", "audio/x-psf") end
	do self:add("*.pw", "application/x-pw") end
	do self:add("*.aifc", "audio/x-aiff") end
	do self:add("*.mml", "text/mathml") end
	do self:add("*.psd", "image/vnd.adobe.photoshop") end
	do self:add("*.mo3", "audio/x-mo3") end
	do self:add("*.aiff", "audio/x-aiff") end
	do self:add("*.gba", "application/x-gba-rom") end
	do self:add("*.awk", "application/x-awk") end
	do self:add("*.not", "text/x-mup") end
	do self:add("changelog", "text/x-changelog") end
	do self:add("*.sv4cpio", "application/x-sv4cpio") end
	do self:add("*%", "application/x-trash") end
	do self:add("*.po", "text/x-gettext-translation") end
	do self:add("*.hdf", "application/x-hdf") end
	do self:add("*.psw", "application/x-pocket-word") end
	do self:add("*.tar.bz", "application/x-bzip-compressed-tar") end
	do self:add("*.php3", "application/x-php") end
	do self:add("*.desktop", "application/x-desktop") end
	do self:add("*.fb2", "application/x-fictionbook+xml") end
	do self:add("*.wb1", "application/x-quattropro") end
	do self:add("*.wb2", "application/x-quattropro") end
	do self:add("*.ora", "image/openraster") end
	do self:add("*.wb3", "application/x-quattropro") end
	do self:add("*.iff", "image/x-iff") end
	do self:add("*.mp+", "audio/x-musepack") end
	do self:add("*.axa", "audio/annodex") end
	do self:add("*.orf", "image/x-olympus-orf") end
	do self:add("*.xbm", "image/x-xbitmap") end
	do self:add("copying", "text/x-copying") end
	do self:add("*.mp2", "audio/mp2") end
	do self:add("*.mp2", "video/mpeg") end
	do self:add("*.mp3", "audio/mpeg") end
	do self:add("*.mp4", "video/mp4") end
	do self:add("*.py", "text/x-python") end
	do self:add("*.kino", "application/smil") end
	do self:add("*.ra", "audio/vnd.rn-realaudio") end
	do self:add("*.rb", "application/x-ruby") end
	do self:add("*.icns", "image/x-icns") end
	do self:add("*.qt", "video/quicktime") end
	do self:add("*.xcf", "image/x-xcf") end
	do self:add("*.mng", "video/x-mng") end
	do self:add("*.xbl", "application/xml") end
	do self:add("*.axv", "video/annodex") end
	do self:add("*.cpio", "application/x-cpio") end
	do self:add("*.rm", "application/vnd.rn-realmedia") end
	do self:add("*.mod", "audio/x-mod") end
	do self:add("*.sv4crc", "application/x-sv4crc") end
	do self:add("*.rp", "image/vnd.rn-realpix") end
	do self:add("*.mof", "text/x-mof") end
	do self:add("*.wav", "audio/x-wav") end
	do self:add("*.rt", "text/vnd.rn-realtext") end
	do self:add("*.wax", "audio/x-ms-asx") end
	do self:add("*.rv", "video/vnd.rn-realvideo") end
	do self:add("*.moc", "text/x-moc") end
	do self:add("*.siag", "application/x-siag") end
	do self:add("*.pack", "application/x-java-pack200") end
	do self:add("*.gnumeric", "application/x-gnumeric") end
	do self:add("*.tnef", "application/vnd.ms-tnef") end
	do self:add("*.tpic", "image/x-tga") end
	do self:add("*.mov", "video/quicktime") end
	do self:add("*.smil", "application/smil") end
	do self:add("*.sh", "application/x-shellscript") end
	do self:add("*.divx", "video/x-msvideo") end
	do self:add("*.sk", "image/x-skencil") end
	do self:add("*.moov", "video/quicktime") end
	do self:add("*.mpc", "audio/x-musepack") end
	do self:add("*.so", "application/x-sharedlib") end
	do self:add("*.mpe", "video/mpeg") end
	do self:add("*.otc", "application/vnd.oasis.opendocument.chart-template") end
	do self:add("*.midi", "audio/midi") end
	do self:add("*.otf", "application/vnd.oasis.opendocument.formula-template") end
	do self:add("*.otf", "application/x-font-otf") end
	do self:add("*.otg", "application/vnd.oasis.opendocument.graphics-template") end
	do self:add("*.oth", "application/vnd.oasis.opendocument.text-web") end
	do self:add("*.mpg", "video/mpeg") end
	do self:add("*.mpp", "audio/x-musepack") end
	do self:add("*.otp", "application/vnd.oasis.opendocument.presentation-template") end
	do self:add("*~", "application/x-trash") end
	do self:add("*.ged", "application/x-gedcom") end
	do self:add("*.ots", "application/vnd.oasis.opendocument.spreadsheet-template") end
	do self:add("*.ott", "application/vnd.oasis.opendocument.text-template") end
	do self:add("*.tar.lzma", "application/x-lzma-compressed-tar") end
	do self:add("*.docm", "application/vnd.openxmlformats-officedocument.wordprocessingml.document") end
	do self:add("makefile", "text/x-makefile") end
	do self:add("*.wcm", "application/vnd.ms-works") end
	do self:add("*.tk", "text/x-tcl") end
	do self:add("*.gen", "application/x-genesis-rom") end
	do self:add("*.docx", "application/vnd.openxmlformats-officedocument.wordprocessingml.document") end
	do self:add("*.log", "text/x-log") end
	do self:add("*.nsc", "application/x-netshow-channel") end
	do self:add("*.egon", "application/x-egon") end
	do self:add("*.tr", "text/troff") end
	do self:add("*.zip", "application/zip") end
	do self:add("*.kml", "application/vnd.google-earth.kml+xml") end
	do self:add("*.iptables", "text/x-iptables") end
	do self:add("*.m15", "audio/x-mod") end
	do self:add("*.wdb", "application/vnd.ms-works") end
	do self:add("*.kmz", "application/vnd.google-earth.kmz") end
	do self:add("*.shar", "application/x-shar") end
	do self:add("*.nsv", "video/x-nsv") end
	do self:add("*.texinfo", "text/x-texinfo") end
	do self:add("*.so.[0-9].*", "application/x-sharedlib") end
	do self:add("*.ui", "application/x-designer") end
	do self:add("*.ilbm", "image/x-ilbm") end
	do self:add("*.3ds", "image/x-3ds") end
	do self:add("*.vbs", "application/x-vbscript") end
	do self:add("*.mrl", "text/x-mrml") end
	do self:add("*.vcf", "text/directory") end
	do self:add("*.mrw", "image/x-minolta-mrw") end
	do self:add("*.jpeg", "image/jpeg") end
	do self:add("*.3g2", "video/3gpp") end
	do self:add("*.dar", "application/x-dar") end
	do self:add("*.tar.gz", "application/x-compressed-tar") end
	do self:add("*.p7b", "application/x-pkcs7-certificates") end
	do self:add("*.lzma", "application/x-lzma") end
	do self:add("*.vct", "text/directory") end
	do self:add("*.vcs", "text/calendar") end
	do self:add("*.msi", "application/x-msi") end
	do self:add("*.msi", "application/x-ms-win-installer") end
	do self:add("*.psid", "audio/prs.sid") end
	do self:add("*.kon", "application/x-kontour") end
	do self:add("*.blender", "application/x-blender") end
	do self:add("*.pyc", "application/x-python-bytecode") end
	do self:add("*.owl", "application/rdf+xml") end
	do self:add("*.vda", "image/x-tga") end
	do self:add("*.dbf", "application/x-dbf") end
	do self:add("*.p7s", "application/pkcs7-signature") end
	do self:add("*.pyo", "application/x-python-bytecode") end
	do self:add("*.msx", "application/x-msx-rom") end
	do self:add("*.epsf.bz2", "image/x-bzeps") end
	do self:add("*.cb7", "application/x-cb7") end
	do self:add("*.jng", "image/x-jng") end
	do self:add("*.texi", "text/x-texinfo") end
	do self:add("*.so.[0-9]", "application/x-sharedlib") end
	do self:add("*.wp", "application/vnd.wordperfect") end
	do self:add("*.kpm", "application/x-kpovmodeler") end
	do self:add("*.jp2", "image/jp2") end
	do self:add("*.wv", "audio/x-wavpack") end
	do self:add("*.cab", "application/vnd.ms-cab-compressed") end
	do self:add("*.kpr", "application/x-kpresenter") end
	do self:add("*.3ga", "video/3gpp") end
	do self:add("*.kpt", "application/x-kpresenter") end
	do self:add("*.n64", "application/x-n64-rom") end
	do self:add("*.mtm", "audio/x-mod") end
	do self:add("*.m2t", "video/mpeg") end
	do self:add("*.glade", "application/x-glade") end
	do self:add("*.oxt", "application/vnd.openofficeorg.extension") end
	do self:add("*.iso9660", "application/x-cd-image") end
	do self:add("*.gif", "image/gif") end
	do self:add("*.dcm", "application/dicom") end
	do self:add("*.ime", "text/x-iMelody") end
	do self:add("*.h++", "text/x-c++hdr") end
	do self:add("*.3gp", "video/3gpp") end
	do self:add("*.tar", "application/x-tar") end
	do self:add("*.dcr", "image/x-kodak-dcr") end
	do self:add("*.xi", "audio/x-xi") end
	do self:add("*.xm", "audio/x-xm") end
	do self:add("*.dcl", "text/x-dcl") end
	do self:add("*.3gpp", "video/3gpp") end
	do self:add("*.kdelnk", "application/x-desktop") end
	do self:add("*.vivo", "video/vivo") end
	do self:add("*.xz", "application/x-xz") end
	do self:add("*.imy", "text/x-iMelody") end
	do self:add("*.m3u", "audio/x-mpegurl") end
	do self:add("*.mup", "text/x-mup") end
	do self:add("*.kra", "application/x-krita") end
	do self:add("*.cbr", "application/x-cbr") end
	do self:add("*.m4b", "audio/x-m4b") end
	do self:add("*.cbt", "application/x-cbt") end
	do self:add("*.cpio.gz", "application/x-cpio-compressed") end
	do self:add("*.m4a", "audio/mp4") end
	do self:add("*.dds", "image/x-dds") end
	do self:add("*.jpe", "image/jpeg") end
	do self:add("*.jpg", "image/jpeg") end
	do self:add("*.cbz", "application/x-cbz") end
	do self:add("*.jpc", "image/jp2") end
	do self:add("*.tbz", "application/x-bzip-compressed-tar") end
	do self:add("*.eps.bz2", "image/x-bzeps") end
	do self:add("*.jpf", "image/jp2") end
	do self:add("*.k25", "image/x-kodak-k25") end
	do self:add("*.jpr", "application/x-jbuilder-project") end
	do self:add("*.7z", "application/x-7z-compressed") end
	do self:add("*.ins", "text/x-tex") end
	do self:add("*.deb", "application/x-deb") end
	do self:add("*.ini", "text/plain") end
	do self:add("*.psf.gz", "application/x-gz-font-linux-psf") end
	do self:add("*.jpx", "application/x-jbuilder-project") end
	do self:add("*.jpx", "image/jp2") end
	do self:add("*.m4v", "video/mp4") end
	do self:add("*.bak", "application/x-trash") end
	do self:add("*.rmvb", "application/vnd.rn-realmedia") end
	do self:add("gmon.out", "application/x-profile") end
	do self:add("*.perl", "application/x-perl") end
	do self:add("*.sam", "application/x-amipro") end
	do self:add("*.fig", "image/x-xfig") end
	do self:add("*.bcpio", "application/x-bcpio") end
	do self:add("*.gtar", "application/x-tar") end
	do self:add("*.ltx", "text/x-tex") end
	do self:add("*.lua", "text/x-lua") end
	do self:add("*.der", "application/x-x509-ca-cert") end
	do self:add("*.sav", "application/x-spss-sav") end
	do self:add("*.wk1", "application/vnd.lotus-1-2-3") end
	do self:add("*.tcl", "text/x-tcl") end
	do self:add("*.wk3", "application/vnd.lotus-1-2-3") end
	do self:add("*.wk4", "application/vnd.lotus-1-2-3") end
	do self:add("*.zoo", "application/x-zoo") end
	do self:add("*.xcf.gz", "image/x-compressed-xcf") end
	do self:add("*.qtif", "image/x-quicktime") end
	do self:add("*.oleo", "application/x-oleo") end
	do self:add("*.ksp", "application/x-kspread") end
	do self:add("*.ps.gz", "application/x-gzpostscript") end
	do self:add("*.opml", "text/x-opml+xml") end
	do self:add("*.cdf", "application/x-netcdf") end
	do self:add("*.vhd", "text/x-vhdl") end
	do self:add("*.xla", "application/vnd.ms-excel") end
	do self:add("*.inf", "text/plain") end
	do self:add("*.xlc", "application/vnd.ms-excel") end
	do self:add("*.xld", "application/vnd.ms-excel") end
	do self:add("*.xlf", "application/x-xliff") end
	do self:add("*.cdr", "application/vnd.corel-draw") end
	do self:add("*.xll", "application/vnd.ms-excel") end
	do self:add("*.xlm", "application/vnd.ms-excel") end
	do self:add("*.602", "application/x-t602") end
	do self:add("*.mxf", "application/mxf") end
	do self:add("*.xls", "application/vnd.ms-excel") end
	do self:add("*.xlt", "application/vnd.ms-excel") end
	do self:add("*.aac", "audio/mp4") end
	do self:add("*.xlsm", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") end
	do self:add("*.xlw", "application/vnd.ms-excel") end
	do self:add("*.docbook", "application/docbook+xml") end
	do self:add("*.raf", "image/x-fuji-raf") end
	do self:add("*.fits", "image/fits") end
	do self:add("*.epsi.gz", "image/x-gzeps") end
	do self:add("*.xlsx", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") end
	do self:add("*.rdfs", "application/rdf+xml") end
	do self:add("*.ram", "application/ram") end
	do self:add("*.eif", "text/x-eiffel") end
	do self:add("*.scm", "text/x-scheme") end
	do self:add("*.ac3", "audio/ac3") end
	do self:add("*.rar", "application/x-rar") end
	do self:add("*.xmf", "audio/x-xmf") end
	do self:add("*.ras", "image/x-cmu-raster") end
	do self:add("*.cer", "application/x-x509-ca-cert") end
	do self:add("*.ldif", "text/x-ldif") end
	do self:add("*.kud", "application/x-kugar") end
	do self:add("*.rax", "audio/vnd.rn-realaudio") end
	do self:add("*.xml", "application/xml") end
	do self:add("*.gmo", "application/x-gettext-translation") end
	do self:add("*.xmi", "text/x-xmi") end
	do self:add("*.CSSL", "text/css") end
	do self:add("*.wks", "application/vnd.lotus-1-2-3") end
	do self:add("*.wks", "application/vnd.ms-works") end
	do self:add("*.tbz2", "application/x-bzip-compressed-tar") end
	do self:add("*.tex", "text/x-tex") end
	do self:add("*.raw", "image/x-panasonic-raw") end
	do self:add("*.sda", "application/vnd.stardivision.draw") end
	do self:add("*.sdc", "application/vnd.stardivision.calc") end
	do self:add("*.sdd", "application/vnd.stardivision.impress") end
	do self:add("*.bdf", "application/x-font-bdf") end
	do self:add("*.lwo", "image/x-lwo") end
	do self:add("*.lws", "image/x-lws") end
	do self:add("*.minipsf", "audio/x-minipsf") end
	do self:add("*.flc", "video/x-flic") end
	do self:add("*.gnc", "application/x-gnucash") end
	do self:add("*.gnd", "application/gnunet-directory") end
	do self:add("*.theme", "application/x-theme") end
	do self:add("*.sdp", "application/vnd.stardivision.impress") end
	do self:add("*.sdp", "application/sdp") end
	do self:add("*.fli", "video/x-flic") end
	do self:add("install", "text/x-install") end
	do self:add("*.sds", "application/vnd.stardivision.chart") end
	do self:add("*.abw", "application/x-abiword") end
	do self:add("*.j2k", "image/jp2") end
	do self:add("core", "application/x-core") end
	do self:add("*.sdw", "application/vnd.stardivision.writer") end
	do self:add("*.viv", "video/vivo") end
	do self:add("*.pdf.gz", "application/x-gzpdf") end
	do self:add("*.hpp", "text/x-c++hdr") end
	do self:add("*.flv", "video/x-flv") end
	do self:add("*.tiff", "image/tiff") end
	do self:add("*.flw", "application/x-kivio") end
	do self:add("*.ace", "application/x-ace") end
	do self:add("*.dvi.bz2", "application/x-bzdvi") end
	do self:add("*.dia", "application/x-dia-diagram") end
	do self:add("*.pcf.Z", "application/x-font-pcf") end
	do self:add("*.gnuplot", "application/x-gnuplot") end
	do self:add("*.wma", "audio/x-ms-wma") end
	do self:add("*.tga", "image/x-tga") end
	do self:add("*.cgm", "image/cgm") end
	do self:add("*.wmf", "image/x-wmf") end
	do self:add("*.torrent", "application/x-bittorrent") end
	do self:add("*.uil", "text/x-uil") end
	do self:add("*.vala", "text/x-vala") end
	do self:add("*.lwob", "image/x-lwo") end
	do self:add("*.kwd", "application/x-kword") end
	do self:add("*.wml", "text/vnd.wap.wml") end
	do self:add("*.iso", "application/x-cd-image") end
	do self:add("*.tgz", "application/x-compressed-tar") end
	do self:add("*.adb", "text/x-adasrc") end
	do self:add("*.wmv", "video/x-ms-wmv") end
	do self:add("*.wmx", "audio/x-ms-asx") end
	do self:add("*.rdf", "application/rdf+xml") end
	do self:add("*.kwt", "application/x-kword") end
	do self:add("*.vlc", "audio/x-mpegurl") end
	do self:add("*.lyx", "application/x-lyx") end
	do self:add("*.pdf.bz2", "application/x-bzpdf") end
	do self:add("*.chm", "application/x-chm") end
	do self:add("*.ufraw", "application/x-ufraw") end
	do self:add("*.gpg", "application/pgp-encrypted") end
	do self:add("*.ads", "text/x-adasrc") end
	do self:add("*.tar.Z", "application/x-tarz") end
	do self:add("*.xpm", "image/x-xpixmap") end
	do self:add("*.djv", "image/vnd.djvu") end
	do self:add("*.wp4", "application/vnd.wordperfect") end
	do self:add("*.wp5", "application/vnd.wordperfect") end
	do self:add("*.wp6", "application/vnd.wordperfect") end
	do self:add("*.xps", "application/vnd.ms-xpsdocument") end
	do self:add("*.lzh", "application/x-lha") end
	do self:add("*.lzo", "application/x-lzop") end
	do self:add("*.pak", "application/x-pak") end
	do self:add("*.sgf", "application/x-go-sgf") end
	do self:add("*.sylk", "text/spreadsheet") end
	do self:add("*.tif", "image/tiff") end
	do self:add("*.par2", "application/x-par2") end
	do self:add("*.sgi", "image/x-sgi") end
	do self:add("*.rej", "application/x-reject") end
	do self:add("*.sgl", "application/vnd.stardivision.writer") end
	do self:add("*.sgm", "text/sgml") end
	do self:add("*.xcf.bz2", "image/x-compressed-xcf") end
	do self:add("*.reg", "text/x-ms-regedit") end
	do self:add("*.pas", "text/x-pascal") end
	do self:add("*.emf", "image/x-emf") end
	do self:add("*.emp", "application/vnd.emusic-emusic_package") end
	do self:add("*.for", "text/x-fortran") end
	do self:add("*.pbm", "image/x-portable-bitmap") end
	do self:add("*.xbel", "application/x-xbel") end
	do self:add("*.gra", "application/x-graphite") end
	do self:add("*.afm", "application/x-font-afm") end
	do self:add("*.wpd", "application/vnd.wordperfect") end
	do self:add("*.shn", "application/x-shorten") end
	do self:add("*.wpg", "application/x-wpg") end
	do self:add("*.svgz", "image/svg+xml-compressed") end
	do self:add("*.cmake", "text/x-cmake") end
	do self:add("*.tar.bz2", "application/x-bzip-compressed-tar") end
	do self:add("*.wpl", "application/vnd.ms-wpl") end
	do self:add("*.dll", "application/x-sharedlib") end
	do self:add("*.ult", "audio/x-mod") end
	do self:add("*.wpp", "application/vnd.wordperfect") end
	do self:add("*.ent", "application/xml-external-parsed-entity") end
	do self:add("*.wps", "application/vnd.ms-works") end
	do self:add("*.669", "audio/x-mod") end
	do self:add("*.jnlp", "application/x-java-jnlp-file") end
	do self:add("*.pcf", "application/x-font-pcf") end
	do self:add("*.pcf", "application/x-cisco-vpn-settings") end
	do self:add("*.pcd", "image/x-photo-cd") end
	do self:add("*.bib", "text/x-bibtex") end
	do self:add("*.rgb", "image/x-rgb") end
	do self:add("*.sid", "audio/prs.sid") end
	do self:add("*.pcl", "application/vnd.hp-pcl") end
	do self:add("*.c++", "text/x-c++src") end
	do self:add("*.htm", "text/html") end
	do self:add("*.voc", "audio/x-voc") end
	do self:add("*.sik", "application/x-trash") end
	do self:add("*.vapi", "text/x-vala") end
	do self:add("*.bin", "application/octet-stream") end
	do self:add("*.vob", "video/mpeg") end
	do self:add("*.gsf", "application/x-font-type1") end
	do self:add("*.sk1", "image/x-skencil") end
	do self:add("*.ag", "image/x-applix-graphics") end
	do self:add("*.ai", "application/illustrator") end
	do self:add("*.sis", "application/vnd.symbian.install") end
	do self:add("*.sit", "application/x-stuffit") end
	do self:add("*.al", "application/x-perl") end
	do self:add("*.gsm", "audio/x-gsm") end
	do self:add("*.siv", "application/sieve") end
	do self:add("*.vor", "application/vnd.stardivision.writer") end
	do self:add("*.xsl", "application/xml") end
	do self:add("*.diff", "text/x-patch") end
	do self:add("*.pdb", "application/x-aportisdoc") end
	do self:add("*.pdb", "application/x-palm-database") end
	do self:add("*.pdc", "application/x-aportisdoc") end
	do self:add("*.as", "application/x-applix-spreadsheet") end
	do self:add("*.au", "audio/basic") end
	do self:add("*.pdf", "application/pdf") end
	do self:add("*.aw", "application/x-applix-word") end
	do self:add("*.obj", "application/x-tgif") end
	do self:add("*.sgml", "text/sgml") end
	do self:add("*.pcx", "image/x-pcx") end
	do self:add("*.dng", "image/x-adobe-dng") end
	do self:add("*.uni", "audio/x-mod") end
	do self:add("*.wbmp", "image/vnd.wap.wbmp") end
	do self:add("*.wri", "application/x-mswrite") end
	do self:add("*.java", "text/x-java") end
	do self:add("*.wrl", "model/vrml") end
	do self:add("*.flac", "audio/x-flac") end
	do self:add("*.cls", "text/x-tex") end
	do self:add("*.eps", "image/x-eps") end
	do self:add("*.kexi", "application/x-kexiproject-sqlite2") end
	do self:add("*.kexi", "application/x-kexiproject-sqlite3") end
	do self:add("*.tlz", "application/x-lzma-compressed-tar") end
	do self:add("*.pef", "image/x-pentax-pef") end
	do self:add("*.aif", "audio/x-aiff") end
	do self:add("*.ocl", "text/x-ocl") end
	do self:add("*.class", "application/x-java") end
	do self:add("*.doc", "application/msword") end
	do self:add("*.pem", "application/x-x509-ca-cert") end
	do self:add("*.bz", "application/x-bzip") end
	do self:add("makefile", "text/x-makefile") end
	do self:add("*.x3f", "image/x-sigma-x3f") end
	do self:add("*.cc", "text/x-c++src") end
	do self:add("*.skr", "application/pgp-keys") end
	do self:add("*.xul", "application/vnd.mozilla.xul+xml") end
	do self:add("*.xul", "application/vnd.mozilla.xul+xml") end
	do self:add("*.dot", "application/msword-template") end
	do self:add("*.dot", "text/vnd.graphviz") end
	do self:add("*.oda", "application/oda") end
	do self:add("*.odb", "application/vnd.oasis.opendocument.database") end
	do self:add("*.odc", "application/vnd.oasis.opendocument.chart") end
	do self:add("*.pict", "image/x-pict") end
	do self:add("*.pfb", "application/x-font-type1") end
	do self:add("*.odf", "application/vnd.oasis.opendocument.formula") end
	do self:add("*.odg", "application/vnd.oasis.opendocument.graphics") end
	do self:add("*.karbon", "application/x-karbon") end
	do self:add("*.odi", "application/vnd.oasis.opendocument.image") end
	do self:add("*.hwp", "application/x-hwp") end
	do self:add("*.xhtml", "application/xhtml+xml") end
	do self:add("*.odm", "application/vnd.oasis.opendocument.text-master") end
	do self:add("*.hwt", "application/x-hwt") end
	do self:add("credits", "text/x-credits") end
	do self:add("*.odp", "application/vnd.oasis.opendocument.presentation") end
	do self:add("*.tnf", "application/vnd.ms-tnef") end
	do self:add("*.pfa", "application/x-font-type1") end
	do self:add("*.ods", "application/vnd.oasis.opendocument.spreadsheet") end
	do self:add("*.odt", "application/vnd.oasis.opendocument.text") end
	do self:add("*.dc", "application/x-dc-rom") end
	do self:add("*.slk", "text/spreadsheet") end
	do self:add("*.erl", "text/x-erlang") end
	do self:add("*.pfx", "application/x-pkcs12") end
	do self:add("*.mab", "application/x-markaby") end
	do self:add("*.sisx", "x-epoc/x-sisx-app") end
	do self:add("*.ustar", "application/x-ustar") end
	do self:add("*.gvp", "text/x-google-video-pointer") end
	do self:add("*.dv", "video/dv") end
	do self:add("*.man", "application/x-troff-man") end
	do self:add("*.qif", "application/x-qw") end
	do self:add("*.qif", "image/x-quicktime") end
	do self:add("*.smd", "application/vnd.stardivision.mail") end
	do self:add("*.toc", "application/x-cdrdao-toc") end
	do self:add("*.smf", "application/vnd.stardivision.math") end
	do self:add("*.pgm", "image/x-portable-graymap") end
	do self:add("*.pgn", "application/x-chess-pgn") end
	do self:add("*.smi", "application/smil") end
	do self:add("*.smi", "application/x-sami") end
	do self:add("*.pgp", "application/pgp-encrypted") end
	do self:add("*.cs", "text/x-csharp") end
	do self:add("*.cs", "text/x-csharp") end
	do self:add("*.sml", "application/smil") end
	do self:add("*.smc", "application/x-snes-rom") end
	do self:add("*.xwd", "image/x-xwindowdump") end
	do self:add("*.bmp", "image/bmp") end
	do self:add("*.blend", "application/x-blender") end
	do self:add("*.com", "application/x-ms-dos-executable") end
	do self:add("*.atom", "application/atom+xml") end
	do self:add("*.sms", "application/x-sms-rom") end
	do self:add("*.el", "text/x-emacs-lisp") end
	do self:add("*.hxx", "text/x-c++hdr") end
	do self:add("*.g3", "image/fax-g3") end
	do self:add("*.vst", "image/x-tga") end
	do self:add("*.es", "application/ecmascript") end
	do self:add("*.PAR2", "application/x-par2") end
	do self:add("*.eps.gz", "image/x-gzeps") end
	do self:add("*.rle", "image/rle") end
	do self:add("*.snd", "audio/basic") end
	do self:add("*.ez", "application/andrew-inset") end
	do self:add("*.psflib", "audio/x-psflib") end
	do self:add("*.nds", "application/x-nintendo-ds-rom") end
	do self:add("*.php", "application/x-php") end
	do self:add("*.wvc", "audio/x-wavpack-correction") end
	do self:add("*.123", "application/vnd.lotus-1-2-3") end
	do self:add("*.uri", "text/x-uri") end
	do self:add("*.url", "text/x-uri") end
	do self:add("*.abw.CRASHED", "application/x-abiword") end
	do self:add("*.cr2", "image/x-canon-cr2") end
	do self:add("*.tar.xz", "application/x-xz-compressed-tar") end
	do self:add("*.roff", "text/troff") end
	do self:add("*.fl", "application/x-fluid") end
	do self:add("*.alz", "application/x-alz") end
	do self:add("*.oga", "audio/ogg") end
	do self:add("*.wvp", "audio/x-wavpack") end
	do self:add("*.nef", "image/x-nikon-nef") end
	do self:add("*,v", "text/plain") end
	do self:add("*.C", "text/x-c++src") end
	do self:add("*.themepack", "application/x-windows-themepack") end
	do self:add("*.ogg", "audio/ogg") end
	do self:add("*.ogg", "audio/x-vorbis+ogg") end
	do self:add("*.ogg", "audio/x-flac+ogg") end
	do self:add("*.ogg", "audio/x-speex+ogg") end
	do self:add("*.ogg", "video/x-theora+ogg") end
	do self:add("*.wvx", "audio/x-ms-asx") end
	do self:add("*.fo", "text/x-xslfo") end
	do self:add("*.etx", "text/x-setext") end
	do self:add("*.pptm", "application/vnd.openxmlformats-officedocument.presentationml.presentation") end
	do self:add("readme", "text/x-readme") end
	do self:add("todo", "text/x-todo") end
	do self:add("license", "text/x-license") end
	do self:add("*.version", "text/x-version") end
	do self:add("Makefile.*", "text/x-makefile") end
	do self:add("*.dmg", "application/x-apple-diskimage") end
	do self:add("*.swp", "application/x-igelle-software-package") end
	do self:add("*.squashfs", "application/x-igelle-diskimage-squashfs") end
	do self:add("*.img", "application/x-igelle-diskimage") end
	do self:add("*.eq", "text/x-eqela-src") end
	do self:add("*.equity", "text/x-eqela-equity-src") end
	do self:add("*.eqic", "text/x-eqela-eqic-config") end
	do self:add("*.config", "text/x-config") end
	do self:add("*.eqlib", "application/x-eqela-library") end
	do self:add("*.eqlibx", "application/x-eqela-library-encrypted") end
	do self:add("*.apk", "application/vnd.android.package-archive") end
	do self:add("*.eo", "application/x-eqela-object") end
	do self:add("*.eo1", "application/x-eqela-object-level-1") end
	do self:add("*.eo2", "application/x-eqela-object-level-2") end
	do self:add("*.eo3", "application/x-eqela-object-level-3") end
	do self:add("*.eo4", "application/x-eqela-object-level-4") end
	do self:add("*.eo5", "application/x-eqela-object-level-5") end
	do self:add("*.iga", "application/x-igelle-archive") end
	do self:add("*.ipa", "application/octet-stream") end
	do self:add("*.xap", "application/x-silverlight-app") end
	do self:add("*.webapp", "application/x-web-app-manifest+json") end
	do self:add("*.json", "application/json") end
	do self:add("*.properties", "application/properties") end
	do self:add(".classpath", "application/xml") end
	do self:add(".project", "application/xml") end
	do self:add("*.bat", "application/x-msdos-program") end
	do self:add("*.yml", "text/yaml") end
	do self:add("*.yaml", "text/yaml") end
	do self:add("*.scss", "text/x-scss") end
	do self:add("*.gradle", "application/x-gradle") end
	do self:add("manifest.mf", "application/x-manifest") end
	do self:add("*.vm", "application/x-velocity") end
	do self:add("*.jade", "application/x-jade") end
	do self:add("*.xsd", "application/xml") end
	do self:add("*.eot", "application/vnd.ms-fontobject") end
	do self:add("*.woff", "application/x-font-woff") end
	do self:add("*.woff2", "application/x-font-woff") end
	do self:add("*.svf", "application/x-font-svf") end
	do self:add("*.fnt", "application/x-font-fnt") end
	do self:add("*.wsdl", "application/wsdl+xml") end
	do self:add("*.jsx", "application/javascript") end
	do self:add("*.ts", "application/x-typescript") end
	do self:add("*.tsx", "application/x-typescript") end
	do self:add("*.jks", "application/x-jks") end
	do self:add("*.jsp", "application/x-jsp") end
	do self:add("*.pom", "application/x-maven-pom") end
	do self:add(".gitignore", "application/x-gitignore") end
	do self:add("org.eclipse.jdt.core.prefs", "application/x-eclipse-prefs") end
	do self:add("org.eclipse.buildship.core.prefs", "application/x-eclipse-prefs") end
	do self:add("*.vsd", "application/vnd.visio") end
	do self:add(".editorconfig", "application/x-editorconfig") end
	do self:add(".htaccess", "application/x-htaccess") end
	do self:add("*.mxml", "application/xml") end
	do self:add("*.tld", "application/xml") end
	do self:add("*.csproj", "application/csproj+xml") end
	do self:add("*.sln", "application/x-sln") end
	do self:add("*.elm", "application/x-elm") end
	do self:add("*.scala", "application/x-scala") end
	do self:add("dockerfile", "application/x-docker-dockerfile") end
	do self:add("gemfile", "application/x-gem-gemfile") end
	do self:add("*.sbt", "application/x-scala-sbt") end
end

function jk.mime.MimeTypeRegistry:getTypeForExtension(ext)
	if not (ext ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Map:get(self.htMime, _g.jk.lang.String:toLowerCase(ext)) end
end

function jk.mime.MimeTypeRegistry:getTypeForFile(f)
	if not (f ~= nil) then
		do return "application/unknown" end
	end
	do return self:getMimeType(f:getBasename()) end
end

function jk.mime.MimeTypeRegistry:getMimeType(str)
	local v = nil
	if str ~= nil then
		local mime = nil
		local ld = _g.jk.lang.String:getLastIndexOfCharacter(str, 46, -1)
		if ld >= 0 then
			mime = _g.jk.lang.String:getEndOfString(str, ld + 1)
		end
		v = _g.jk.lang.Map:get(self.htMime, _g.jk.lang.String:toLowerCase(mime))
		if _g.jk.lang.String:isEmpty(v) then
			v = _g.jk.lang.Map:get(self.htMime, _g.jk.lang.String:toLowerCase(str))
		end
	end
	if _g.jk.lang.String:isEmpty(v) then
		v = "application/unknown"
	end
	do return v end
end

function jk.mime.MimeTypeRegistry:getExtension(mimeType)
	do return _g.jk.lang.Map:get(self.htExt, mimeType) end
end

function jk.mime.MimeTypeRegistry:add(pattern, mimeType)
	local v = false
	if pattern == nil or mimeType == nil then
	elseif _g.jk.lang.String:startsWith(pattern, ".", 0) == true then
		local key = _g.jk.lang.String:getSubString(pattern, 1, _g.jk.lang.String:getLength(pattern) - 1)
		do _g.jk.lang.Map:set(self.htMime, key, mimeType) end
		do _g.jk.lang.Map:set(self.htExt, mimeType, key) end
		v = true
	elseif _g.jk.lang.String:startsWith(pattern, "*.", 0) == true then
		local key = _g.jk.lang.String:getSubString(pattern, 2, _g.jk.lang.String:getLength(pattern) - 2)
		do _g.jk.lang.Map:set(self.htMime, key, mimeType) end
		do _g.jk.lang.Map:set(self.htExt, mimeType, key) end
		v = true
	elseif _g.jk.lang.String:startsWith(pattern, "#", 0) == true then
	else
		do _g.jk.lang.Map:set(self.htMime, pattern, mimeType) end
		do _g.jk.lang.Map:set(self.htExt, mimeType, pattern) end
		v = true
	end
	do return v end
end

function jk.mime.MimeTypeRegistry:read(file)
	if not (file ~= nil) then
		do return false end
	end
	do
		local buf = _g.jk.io.PrintReader:forReader(file:read())
		if not (buf ~= nil) then
			do return false end
		end
		do
			local n = 0
			while true do
				local line = buf:readLine()
				if not (line ~= nil) then
					do break end
				end
				do
					local va = _g.jk.lang.String:split(line, 58, 0)
					local val = _g.jk.lang.Vector:iterate(va)
					if val ~= nil then
						local front = val:next()
						local back = val:next()
						if front ~= nil then
							front = _g.jk.lang.String:strip(front)
						end
						if back ~= nil then
							back = _g.jk.lang.String:strip(back)
						end
						if self:add(front, back) then
							do n = n + 1 end
						end
					end
				end
			end
			do return true end
		end
	end
end
