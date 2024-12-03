# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	ab_glyph@0.2.26
	ab_glyph_rasterizer@0.1.8
	addr2line@0.22.0
	adler@1.0.2
	ahash@0.7.8
	ahash@0.8.11
	aho-corasick@1.1.3
	aliasable@0.1.3
	allocator-api2@0.2.18
	alsa-sys@0.3.1
	alsa@0.9.0
	android-activity@0.6.0
	android-properties@0.2.2
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anyhow@1.0.86
	approx@0.5.1
	arrayref@0.3.7
	arrayvec@0.7.4
	as-raw-xcb-connection@1.0.1
	ash@0.37.3+1.3.251
	ashpd@0.8.1
	async-broadcast@0.7.1
	async-channel@2.3.1
	async-executor@1.12.0
	async-fs@2.1.2
	async-http-proxy@1.2.5
	async-io@2.3.3
	async-lock@3.4.0
	async-process@2.2.3
	async-recursion@1.1.1
	async-signal@0.2.8
	async-task@4.7.1
	async-trait@0.1.80
	atomic-waker@1.1.2
	autocfg@1.3.0
	backtrace@0.3.73
	base64@0.13.1
	base64@0.21.7
	base64@0.22.1
	bindgen@0.69.4
	bit-set@0.5.3
	bit-vec@0.6.3
	bit_field@0.10.2
	bitflags@1.3.2
	bitflags@2.5.0
	block-buffer@0.10.4
	block2@0.5.1
	block@0.1.6
	blocking@1.6.1
	bumpalo@3.16.0
	by_address@1.2.1
	bytemuck@1.16.1
	bytemuck_derive@1.7.0
	byteorder@1.5.0
	bytes@1.6.0
	bytesize@1.3.0
	calloop-wayland-source@0.2.0
	calloop@0.12.4
	cc@1.0.99
	cesu8@1.1.0
	cexpr@0.6.0
	cfg-if@1.0.0
	cfg_aliases@0.1.1
	cfg_aliases@0.2.1
	chrono@0.4.38
	clang-sys@1.8.1
	claxon@0.4.3
	clipboard-win@5.3.1
	clipboard_macos@0.1.0
	clipboard_wayland@0.2.2
	clipboard_x11@0.4.2
	codespan-reporting@0.11.1
	color_quant@1.1.0
	com@0.6.0
	com_macros@0.6.0
	com_macros_support@0.6.0
	combine@4.6.7
	concurrent-queue@2.5.0
	core-foundation-sys@0.8.6
	core-foundation@0.9.4
	core-graphics-types@0.1.3
	core-graphics@0.23.2
	coreaudio-rs@0.11.3
	coreaudio-sys@0.2.15
	cosmic-text@0.12.0
	cpal@0.15.3
	cpufeatures@0.2.12
	crc32fast@1.4.2
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.20
	crunchy@0.2.2
	crypto-common@0.1.6
	ctor-lite@0.1.0
	cursor-icon@1.1.0
	d3d12@0.19.0
	dark-light@1.1.1
	dasp_sample@0.11.0
	dconf_rs@0.3.0
	deranged@0.3.11
	detect-desktop-environment@0.2.0
	digest@0.10.7
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	dirs-sys@0.3.7
	dirs@4.0.0
	dispatch@0.2.0
	dlib@0.5.2
	dlv-list@0.3.0
	downcast-rs@1.2.1
	drm-ffi@0.8.0
	drm-fourcc@2.2.0
	drm-sys@0.7.0
	drm@0.12.0
	either@1.12.0
	embed-resource@2.4.2
	encoding_rs@0.8.34
	endi@1.1.0
	enumflags2@0.7.10
	enumflags2_derive@0.7.10
	equivalent@1.0.1
	errno@0.3.9
	error-code@3.2.0
	etagere@0.2.13
	euclid@0.22.10
	event-listener-strategy@0.5.2
	event-listener@5.3.1
	exr@1.72.0
	fast-socks5@0.9.6
	fast-srgb8@1.0.0
	fastrand@2.1.0
	fdeflate@0.3.4
	fern@0.6.2
	flate2@1.0.30
	flume@0.11.0
	fnv@1.0.7
	font-types@0.5.5
	fontconfig-parser@0.5.6
	fontdb@0.16.2
	foreign-types-macros@0.2.3
	foreign-types-shared@0.1.1
	foreign-types-shared@0.3.1
	foreign-types@0.3.2
	foreign-types@0.5.0
	form_urlencoded@1.2.1
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-lite@2.3.0
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	futures@0.3.30
	generic-array@0.14.7
	gethostname@0.4.3
	getrandom@0.2.15
	gif@0.13.1
	gimli@0.29.0
	gl_generator@0.14.0
	glam@0.25.0
	glob@0.3.1
	glow@0.13.1
	glutin_wgl_sys@0.5.0
	gpu-alloc-types@0.3.0
	gpu-alloc@0.6.0
	gpu-allocator@0.25.0
	gpu-descriptor-types@0.1.2
	gpu-descriptor@0.2.4
	guillotiere@0.6.2
	h2@0.4.5
	half@2.4.1
	hashbrown@0.12.3
	hashbrown@0.14.5
	hassle-rs@0.11.0
	heck@0.4.1
	hermit-abi@0.3.9
	hermit-abi@0.4.0
	hex@0.4.3
	hexf-parse@0.2.1
	hound@3.5.1
	http-body-util@0.1.2
	http-body@1.0.0
	http@1.1.0
	httparse@1.9.4
	hyper-rustls@0.27.2
	hyper-tls@0.6.0
	hyper-util@0.1.5
	hyper@1.3.1
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.60
	idna@0.5.0
	image@0.24.9
	indexmap@2.2.6
	instant@0.1.13
	interprocess@1.2.1
	intmap@0.7.1
	ipnet@2.9.0
	is-docker@0.2.0
	is-wsl@0.4.0
	isolang@2.4.0
	itertools@0.12.1
	itertools@0.13.0
	itoa@1.0.11
	jni-sys@0.3.0
	jni@0.21.1
	jobserver@0.1.31
	jpeg-decoder@0.3.1
	js-sys@0.3.69
	kamadak-exif@0.5.5
	khronos-egl@6.0.0
	khronos_api@3.1.0
	kurbo@0.10.4
	lazy_static@1.5.0
	lazycell@1.3.0
	lebe@0.5.2
	lewton@0.10.2
	libc@0.2.155
	libloading@0.7.4
	libloading@0.8.3
	libm@0.2.8
	libredox@0.0.2
	libredox@0.1.3
	linux-raw-sys@0.4.14
	linux-raw-sys@0.6.4
	lock_api@0.4.12
	log@0.4.21
	lru@0.12.3
	mac-notification-sys@0.6.1
	mach2@0.4.2
	malloc_buf@0.0.6
	memchr@2.7.4
	memmap2@0.9.4
	memoffset@0.9.1
	metal@0.27.0
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.7.4
	mio@0.8.11
	mutate_once@0.1.1
	naga@0.19.2
	native-tls@0.2.12
	ndk-context@0.1.1
	ndk-sys@0.5.0+25.2.9519653
	ndk-sys@0.6.0+11769913
	ndk@0.8.0
	ndk@0.9.0
	nix@0.28.0
	nom@7.1.3
	notify-rust@4.11.0
	num-conv@0.1.0
	num-derive@0.4.2
	num-traits@0.2.19
	num_cpus@1.16.0
	num_enum@0.7.2
	num_enum_derive@0.7.2
	objc-foundation@0.1.1
	objc-sys@0.3.5
	objc2-app-kit@0.2.2
	objc2-cloud-kit@0.2.2
	objc2-contacts@0.2.2
	objc2-core-data@0.2.2
	objc2-core-image@0.2.2
	objc2-core-location@0.2.2
	objc2-encode@4.0.3
	objc2-foundation@0.2.2
	objc2-link-presentation@0.2.2
	objc2-metal@0.2.2
	objc2-quartz-core@0.2.2
	objc2-symbols@0.2.2
	objc2-ui-kit@0.2.2
	objc2-uniform-type-identifiers@0.2.2
	objc2-user-notifications@0.2.2
	objc2@0.5.2
	objc@0.2.7
	objc_exception@0.1.2
	objc_id@0.1.1
	object@0.36.0
	oboe-sys@0.6.1
	oboe@0.6.1
	ogg@0.8.0
	once_cell@1.19.0
	open@5.1.4
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-sys@0.9.102
	openssl@0.10.64
	orbclient@0.3.47
	ordered-multimap@0.4.3
	ordered-stream@0.2.0
	ouroboros@0.18.4
	ouroboros_macro@0.18.4
	owned_ttf_parser@0.21.0
	palette@0.7.6
	palette_derive@0.7.6
	parking@2.2.0
	parking_lot@0.11.2
	parking_lot@0.12.3
	parking_lot_core@0.8.6
	parking_lot_core@0.9.10
	paste@1.0.15
	pathdiff@0.2.1
	percent-encoding@2.3.1
	phf@0.11.2
	phf_generator@0.11.2
	phf_macros@0.11.2
	phf_shared@0.11.2
	pin-project-internal@1.1.5
	pin-project-lite@0.2.14
	pin-project@1.1.5
	pin-utils@0.1.0
	piper@0.2.3
	pkg-config@0.3.30
	png@0.17.13
	polling@3.7.2
	pollster@0.3.0
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	presser@0.3.1
	proc-macro-crate@3.1.0
	proc-macro2-diagnostics@0.10.1
	proc-macro2@1.0.85
	profiling@1.0.15
	qoi@0.4.1
	quick-xml@0.31.0
	quote@1.0.36
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	range-alloc@0.1.3
	rangemap@1.5.1
	raw-window-handle@0.6.2
	rayon-core@1.12.1
	rayon@1.10.0
	read-fonts@0.19.3
	redox_syscall@0.2.16
	redox_syscall@0.4.1
	redox_syscall@0.5.2
	redox_users@0.4.5
	regex-automata@0.4.7
	regex-syntax@0.8.4
	regex@1.10.5
	renderdoc-sys@1.1.0
	reqwest@0.12.5
	rfd@0.14.1
	ring@0.17.8
	rodio@0.19.0
	roxmltree@0.19.0
	rust-ini@0.18.0
	rustc-demangle@0.1.24
	rustc-hash@1.1.0
	rustc-hash@2.0.0
	rustc_version@0.4.0
	rustix@0.38.34
	rustls-native-certs@0.7.0
	rustls-pemfile@2.1.2
	rustls-pki-types@1.7.0
	rustls-webpki@0.102.4
	rustls@0.23.10
	rustybuzz@0.14.1
	ryu@1.0.18
	same-file@1.0.6
	schannel@0.1.23
	scoped-tls@1.0.1
	scopeguard@1.2.0
	sctk-adwaita@0.9.0
	seahash@4.1.0
	security-framework-sys@2.11.0
	security-framework@2.11.0
	self_cell@1.0.4
	semver@1.0.23
	serde@1.0.203
	serde_derive@1.0.203
	serde_json@1.0.117
	serde_repr@0.1.19
	serde_spanned@0.6.6
	serde_urlencoded@0.7.1
	sha1@0.10.6
	sha2@0.10.8
	shlex@1.3.0
	signal-hook-registry@1.4.2
	simd-adler32@0.3.7
	siphasher@0.3.11
	skrifa@0.19.3
	slab@0.4.9
	slotmap@1.0.7
	smallvec@1.13.2
	smithay-client-toolkit@0.18.1
	smithay-clipboard@0.7.1
	smol_str@0.2.2
	socket2@0.5.7
	softbuffer@0.4.4
	spin@0.9.8
	spinning@0.1.0
	spirv@0.3.0+sdk-1.3.268.0
	static_assertions@1.1.0
	strict-num@0.1.1
	subtle@2.5.0
	svg_fmt@0.4.3
	swash@0.1.17
	symphonia-bundle-mp3@0.5.4
	symphonia-core@0.5.4
	symphonia-metadata@0.5.4
	symphonia@0.5.4
	syn@1.0.109
	syn@2.0.66
	sync_wrapper@1.0.1
	sys-locale@0.3.1
	system-configuration-sys@0.5.0
	system-configuration@0.5.1
	tauri-winrt-notification@0.2.1
	tempfile@3.10.1
	termcolor@1.4.1
	thiserror-impl@1.0.61
	thiserror@1.0.61
	tiff@0.9.1
	time-core@0.1.2
	time@0.3.36
	timeago@0.4.2
	tiny-skia-path@0.11.4
	tiny-skia@0.11.4
	tiny-xlib@0.2.3
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	to_method@1.1.0
	tokio-macros@2.3.0
	tokio-native-tls@0.3.1
	tokio-rustls@0.26.0
	tokio-stream@0.1.15
	tokio-util@0.7.11
	tokio@1.38.0
	toml@0.8.14
	toml_datetime@0.6.6
	toml_edit@0.21.1
	toml_edit@0.22.14
	tower-layer@0.3.2
	tower-service@0.3.2
	tower@0.4.13
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing@0.1.40
	try-lock@0.2.5
	ttf-parser@0.20.0
	ttf-parser@0.21.1
	typenum@1.17.0
	uds_windows@1.1.0
	unicode-bidi-mirroring@0.2.0
	unicode-bidi@0.3.15
	unicode-ccc@0.2.0
	unicode-ident@1.0.12
	unicode-linebreak@0.1.5
	unicode-normalization@0.1.23
	unicode-properties@0.1.1
	unicode-script@0.5.6
	unicode-segmentation@1.11.0
	unicode-width@0.1.13
	unicode-xid@0.2.4
	untrusted@0.9.0
	url@2.5.2
	urlencoding@2.1.3
	uuid@1.8.0
	vcpkg@0.2.15
	version_check@0.9.4
	vswhom-sys@0.1.2
	vswhom@0.1.0
	walkdir@2.5.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.92
	wasm-bindgen-futures@0.4.42
	wasm-bindgen-macro-support@0.2.92
	wasm-bindgen-macro@0.2.92
	wasm-bindgen-shared@0.2.92
	wasm-bindgen@0.2.92
	wasm-timer@0.2.5
	wayland-backend@0.3.4
	wayland-client@0.31.3
	wayland-csd-frame@0.3.0
	wayland-cursor@0.31.3
	wayland-protocols-plasma@0.2.0
	wayland-protocols-wlr@0.2.0
	wayland-protocols@0.31.2
	wayland-scanner@0.31.2
	wayland-sys@0.31.2
	web-sys@0.3.67
	web-time@1.1.0
	weezl@0.1.8
	wgpu-core@0.19.4
	wgpu-hal@0.19.4
	wgpu-types@0.19.2
	wgpu@0.19.4
	widestring@1.1.0
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.8
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	window_clipboard@0.4.1
	windows-core@0.52.0
	windows-core@0.54.0
	windows-core@0.56.0
	windows-implement@0.56.0
	windows-interface@0.56.0
	windows-result@0.1.2
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows-targets@0.52.5
	windows-version@0.1.1
	windows@0.52.0
	windows@0.54.0
	windows@0.56.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.5
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.5
	windows_exe_info@0.4.2
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.5
	windows_i686_gnullvm@0.52.5
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.5
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.5
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.5
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.5
	winnow@0.5.40
	winnow@0.6.13
	winreg@0.10.1
	winreg@0.52.0
	x11-dl@2.21.0
	x11rb-protocol@0.13.1
	x11rb@0.13.1
	xcursor@0.3.5
	xdg-home@1.2.0
	xdg@2.5.2
	xkbcommon-dl@0.4.2
	xkeysym@0.2.1
	xml-rs@0.8.20
	yansi@1.0.1
	yazi@0.1.6
	zbus@4.3.0
	zbus_macros@4.3.0
	zbus_names@3.0.0
	zeno@0.2.3
	zerocopy-derive@0.7.34
	zerocopy@0.7.34
	zeroize@1.8.1
	zune-inflate@0.2.54
	zvariant@4.1.1
	zvariant_derive@4.1.1
	zvariant_utils@2.0.0
"

declare -A GIT_CRATES=(
	[dpi]='https://github.com/iced-rs/winit;254d6b3420ce4e674f516f7a2bd440665e05484d;winit-%commit%/dpi'
	[glyphon]='https://github.com/hecrj/glyphon;feef9f5630c2adb3528937e55f7bfad2da561a65;glyphon-%commit%'
	[iced]='https://github.com/iced-rs/iced;6734d183594ebf89b8e6c030ea69d53ecb6b72db;iced-%commit%'
	[iced_core]='https://github.com/iced-rs/iced;6734d183594ebf89b8e6c030ea69d53ecb6b72db;iced-%commit%/core'
	[iced_futures]='https://github.com/iced-rs/iced;6734d183594ebf89b8e6c030ea69d53ecb6b72db;iced-%commit%/futures'
	[iced_graphics]='https://github.com/iced-rs/iced;6734d183594ebf89b8e6c030ea69d53ecb6b72db;iced-%commit%/graphics'
	[iced_renderer]='https://github.com/iced-rs/iced;6734d183594ebf89b8e6c030ea69d53ecb6b72db;iced-%commit%/renderer'
	[iced_runtime]='https://github.com/iced-rs/iced;6734d183594ebf89b8e6c030ea69d53ecb6b72db;iced-%commit%/runtime'
	[iced_tiny_skia]='https://github.com/iced-rs/iced;6734d183594ebf89b8e6c030ea69d53ecb6b72db;iced-%commit%/tiny_skia'
	[iced_wgpu]='https://github.com/iced-rs/iced;6734d183594ebf89b8e6c030ea69d53ecb6b72db;iced-%commit%/wgpu'
	[iced_widget]='https://github.com/iced-rs/iced;6734d183594ebf89b8e6c030ea69d53ecb6b72db;iced-%commit%/widget'
	[iced_winit]='https://github.com/iced-rs/iced;6734d183594ebf89b8e6c030ea69d53ecb6b72db;iced-%commit%/winit'
	[winit]='https://github.com/iced-rs/winit;254d6b3420ce4e674f516f7a2bd440665e05484d;winit-%commit%'
)

inherit cargo desktop xdg

DESCRIPTION="IRC application written in Rust"
HOMEPAGE="https://github.com/squidowl/halloy"
LICENSE="GPL-3"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 BSD-2 BSD Boost-1.0 CC0-1.0 ISC MIT MPL-2.0
	Unicode-DFS-2016 ZLIB
"
SLOT="0"

IUSE="opengl +vulkan wayland +X"
REQUIRED_USE="
	|| ( opengl vulkan )
	vulkan? ( || ( wayland X ) )
"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/squidowl/halloy"
else
	KEYWORDS="~amd64"
	SRC_URI="
		https://github.com/squidowl/halloy/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
		${CARGO_CRATE_URIS}
	"
fi

# https://github.com/iced-rs/iced/blob/master/DEPENDENCIES.md
BDEPEND="
	virtual/pkgconfig
"
DEPEND="
	dev-libs/expat
	dev-libs/openssl
	media-libs/fontconfig
	media-libs/freetype[X?]
	opengl? ( media-libs/libglvnd[X?] )
	vulkan? ( media-libs/vulkan-loader[wayland?,X?] )
	wayland? ( dev-libs/wayland	)
	X? (
		x11-libs/libX11
		x11-libs/libXcursor
		x11-libs/libXi
		x11-libs/libXrandr
	)
"
RDEPEND="${DEPEND}"

QA_FLAGS_IGNORED="usr/bin/${PN}"

src_unpack() {
	if [[ ${PV} = *9999* ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

src_configure() {
	if [[ ${PV} != *9999* ]]; then
		# Fix cargo.eclass handling of patched dependencies
		# https://github.com/squidowl/halloy/blob/2024.7/Cargo.toml#L53-L54
		sed -i "s,'https://github.com/iced-rs/iced',crates-io,g" \
			"${ECARGO_HOME}/config.toml" || die
	fi
	cargo_src_configure
}

src_compile() {
	export OPENSSL_NO_VENDOR=1
	export PKG_CONFIG_ALLOW_CROSS=1
	cargo_src_compile
}

src_install() {
	local size
	for size in 24 32 48 64 96 128 256 512; do
		doicon --size ${size} assets/linux/icons/hicolor/${size}x${size}/apps/org.squidowl.${PN}.png
	done

	domenu assets/linux/org.squidowl.${PN}.desktop

	cargo_src_install
}
