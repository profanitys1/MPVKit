// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "MPVKit",
    platforms: [.macOS(.v12), .iOS(.v15), .tvOS(.v15), .visionOS(.v1)],
    products: [
        .library(
            name: "MPVKit",
            targets: ["_MPVKit"]
        ),
        .library(
            name: "MPVKit-GPL",
            targets: ["_MPVKit-GPL"]
        ),
    ],
    targets: [
        .target(
            name: "_MPVKit",
            dependencies: [
                "Libmpv", "_FFmpeg", "Libuchardet", "Libbluray",
                // Libluajit removed to avoid code signing issues in notarized apps
            ],
            path: "Sources/_MPVKit",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreAudio"),
            ]
        ),
        .target(
            name: "_FFmpeg",
            dependencies: [
                "Libavcodec", "Libavdevice", "Libavfilter", "Libavformat", "Libavutil", "Libswresample", "Libswscale",
                "Libssl", "Libcrypto", "Libass", "Libfreetype", "Libfribidi", "Libharfbuzz",
                "MoltenVK", "Libshaderc_combined", "lcms2", "Libplacebo", "Libdovi", "Libunibreak",
                "gmp", "nettle", "hogweed", "gnutls", "Libdav1d", "Libuavs3d"
            ],
            path: "Sources/_FFmpeg",
            linkerSettings: [
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("Metal"),
                .linkedFramework("VideoToolbox"),
                .linkedLibrary("bz2"),
                .linkedLibrary("iconv"),
                .linkedLibrary("expat"),
                .linkedLibrary("resolv"),
                .linkedLibrary("xml2"),
                .linkedLibrary("z"),
                .linkedLibrary("c++"),
            ]
        ),
        .target(
            name: "_MPVKit-GPL",
            dependencies: [
                "Libmpv-GPL", "_FFmpeg-GPL", "Libuchardet", "Libbluray",
                // Libluajit removed to avoid code signing issues in notarized apps
            ],
            path: "Sources/_MPVKit-GPL",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreAudio"),
            ]
        ),
        .target(
            name: "_FFmpeg-GPL",
            dependencies: [
                "Libavcodec-GPL", "Libavdevice-GPL", "Libavfilter-GPL", "Libavformat-GPL", "Libavutil-GPL", "Libswresample-GPL", "Libswscale-GPL",
                "Libssl", "Libcrypto", "Libass", "Libfreetype", "Libfribidi", "Libharfbuzz",
                "MoltenVK", "Libshaderc_combined", "lcms2", "Libplacebo", "Libdovi", "Libunibreak",
                "Libsmbclient", "gmp", "nettle", "hogweed", "gnutls", "Libdav1d", "Libuavs3d"
            ],
            path: "Sources/_FFmpeg-GPL",
            linkerSettings: [
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("Metal"),
                .linkedFramework("VideoToolbox"),
                .linkedLibrary("bz2"),
                .linkedLibrary("iconv"),
                .linkedLibrary("expat"),
                .linkedLibrary("resolv"),
                .linkedLibrary("xml2"),
                .linkedLibrary("z"),
                .linkedLibrary("c++"),
            ]
        ),

        // GPL builds with MXF demuxer, VVC/APV decoders (MPV 0.41, FFmpeg n8.1.2), no LuaJIT
        .binaryTarget(
            name: "Libmpv-GPL",
            url: "https://github.com/profanitys1/MPVKit/releases/download/amp-1.0.0-mpv3186d36-pl92b5ac6.2/Libmpv-GPL.xcframework.zip",
            checksum: "a91a90fe758b626124be24a64c0d875306acfde7985b04f216e40bbed09c7823"
        ),
        .binaryTarget(
            name: "Libavcodec-GPL",
            url: "https://github.com/profanitys1/MPVKit/releases/download/amp-1.0.0-mpv3186d36-pl92b5ac6.2/Libavcodec-GPL.xcframework.zip",
            checksum: "9a3f86f33eba26752bf2cfb11530b98c9f760c7c77c4dcb1179df2e899049675"
        ),
        .binaryTarget(
            name: "Libavdevice-GPL",
            url: "https://github.com/profanitys1/MPVKit/releases/download/amp-1.0.0-mpv3186d36-pl92b5ac6.2/Libavdevice-GPL.xcframework.zip",
            checksum: "5819df2dc0aafc2282a34a9533289cd0982cde2f9358cc14eafef91b855833d5"
        ),
        .binaryTarget(
            name: "Libavformat-GPL",
            url: "https://github.com/profanitys1/MPVKit/releases/download/amp-1.0.0-mpv3186d36-pl92b5ac6.2/Libavformat-GPL.xcframework.zip",
            checksum: "d30f7c1dc6dda77b0cacd25030d7974e94f73d889f2e06e83e2d85d3c994b4f6"
        ),
        .binaryTarget(
            name: "Libavfilter-GPL",
            url: "https://github.com/profanitys1/MPVKit/releases/download/amp-1.0.0-mpv3186d36-pl92b5ac6.2/Libavfilter-GPL.xcframework.zip",
            checksum: "622f79a7ae65e8a2a62be07b5b986c1f1da35e31ac5682fdb3364e31f2a57939"
        ),
        .binaryTarget(
            name: "Libavutil-GPL",
            url: "https://github.com/profanitys1/MPVKit/releases/download/amp-1.0.0-mpv3186d36-pl92b5ac6.2/Libavutil-GPL.xcframework.zip",
            checksum: "9c3dbf4916bfb984ed1fd7d2340953ae98b70c4ea26fbe8bd6685b492597d134"
        ),
        .binaryTarget(
            name: "Libswresample-GPL",
            url: "https://github.com/profanitys1/MPVKit/releases/download/amp-1.0.0-mpv3186d36-pl92b5ac6.2/Libswresample-GPL.xcframework.zip",
            checksum: "c98dd3be25c58f60b89d26e4f5368972b1bfe8524aaabb2e8319bb0201405749"
        ),
        .binaryTarget(
            name: "Libswscale-GPL",
            url: "https://github.com/profanitys1/MPVKit/releases/download/amp-1.0.0-mpv3186d36-pl92b5ac6.2/Libswscale-GPL.xcframework.zip",
            checksum: "f23c86f5c17702346a3ae4aca4cc4c5ee487ae2440f2648ada23d187a4eef7dc"
        ),
        //AUTO_GENERATE_TARGETS_BEGIN//

        .binaryTarget(
            name: "Libcrypto",
            url: "https://github.com/mpvkit/openssl-build/releases/download/3.3.5/Libcrypto.xcframework.zip",
            checksum: "593283be2a90f7fd66f6e6ed331b2f099cf403e0926fe3b4ac09a7062b793965"
        ),
        .binaryTarget(
            name: "Libssl",
            url: "https://github.com/mpvkit/openssl-build/releases/download/3.3.5/Libssl.xcframework.zip",
            checksum: "ff5ffd43d015d7285fd37e4a3145b25cbd8d2842740bd629a711c299a20e226a"
        ),

        .binaryTarget(
            name: "gmp",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/gmp.xcframework.zip",
            checksum: "ad33c7a08f4cdcb9924c8f0e6d9a054dad33d7794b97667bf8b6fb2b236ae585"
        ),

        .binaryTarget(
            name: "nettle",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/nettle.xcframework.zip",
            checksum: "0fdf3ebf8bd7b8bc8eee837cf27261cb4c52ae520b6576a2f468656aa1691e02"
        ),
        .binaryTarget(
            name: "hogweed",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/hogweed.xcframework.zip",
            checksum: "25727c9fa67287fa0a4f4722f88bb8be669b23cd7e837e2d00870eb8a25d3f27"
        ),

        .binaryTarget(
            name: "gnutls",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/gnutls.xcframework.zip",
            checksum: "3dbec5809339189bf9679e218c6cff387ebf8fb72745927835afc2678f5c9f4d"
        ),

        .binaryTarget(
            name: "Libunibreak",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libunibreak.xcframework.zip",
            checksum: "940d9833cf4477d0a260d9f2b4066125bc0ff7bbc111ac3c90e774765b77a559"
        ),

        .binaryTarget(
            name: "Libfreetype",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libfreetype.xcframework.zip",
            checksum: "496ca62488530e14b1e4624d20ee2b237c0bd675cd70c19da578a5768302d02d"
        ),

        .binaryTarget(
            name: "Libfribidi",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libfribidi.xcframework.zip",
            checksum: "bc15e097b892f2f90424e4a27ba287070cc2f98a74a4da10e6d2481d15cf5ff9"
        ),

        .binaryTarget(
            name: "Libharfbuzz",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libharfbuzz.xcframework.zip",
            checksum: "aa8e0b9ca0387dac74e3e93c86e34d11982bb013b28022d0e6966a8427a35b2e"
        ),

        .binaryTarget(
            name: "Libass",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libass.xcframework.zip",
            checksum: "3f4c576d2818ceb4544aa2a20e1f55846511c5e706fd19adc3ea9fd842270498"
        ),

        .binaryTarget(
            name: "Libsmbclient",
            url: "https://github.com/mpvkit/libsmbclient-build/releases/download/4.15.13-2512/Libsmbclient.xcframework.zip",
            checksum: "3a53375fab11bc888cc553664ea5dd902208d04f0cc21ec746302bf356246b6f"
        ),

        .binaryTarget(
            name: "Libbluray",
            url: "https://github.com/mpvkit/libbluray-build/releases/download/1.4.0/Libbluray.xcframework.zip",
            checksum: "bc037d34e2b0b5ab7f202fb371f5fb298136cc66fdf406c2172185d06f53f18d"
        ),

        .binaryTarget(
            name: "Libuavs3d",
            url: "https://github.com/mpvkit/libuavs3d-build/releases/download/1.2.1-fix/Libuavs3d.xcframework.zip",
            checksum: "bd5256081486d16c51c868d755bf70266c424b54c895269580de44ec6707f789"
        ),

        .binaryTarget(
            name: "Libdovi",
            url: "https://github.com/mpvkit/libdovi-build/releases/download/3.3.2/Libdovi.xcframework.zip",
            checksum: "e693e239808350868e79c5448ef9f02e2716bc822dd8632a41a368a1eae5ca7d"
        ),

        .binaryTarget(
            name: "MoltenVK",
            url: "https://github.com/mpvkit/moltenvk-build/releases/download/1.4.2/MoltenVK.xcframework.zip",
            checksum: "aee189c54ad7c62bf734a3dc51eb4cfad5685d1d63b0ec519ecd1b437c332418"
        ),

        .binaryTarget(
            name: "Libshaderc_combined",
            url: "https://github.com/mpvkit/libshaderc-build/releases/download/2025.5.0/Libshaderc_combined.xcframework.zip",
            checksum: "758047b615708575b580eb960a2d083f760a29dc462d6eaa360416c946ce433b"
        ),

        .binaryTarget(
            name: "lcms2",
            url: "https://github.com/mpvkit/lcms2-build/releases/download/2.17.0/lcms2.xcframework.zip",
            checksum: "dc0dce0606f6ab6841a8ec5a6bd4448e2f3ef00661a050460f806c9393dc6982"
        ),

        .binaryTarget(
            name: "Libplacebo",
            url: "https://github.com/profanitys1/MPVKit/releases/download/amp-1.0.0-mpv3186d36-pl92b5ac6/Libplacebo.xcframework.zip",
            checksum: "841e185d2d6f9e1085c9272aa132330761c295c8b44d3648385d143553a9a17b"
        ),

        .binaryTarget(
            name: "Libdav1d",
            url: "https://github.com/mpvkit/libdav1d-build/releases/download/1.5.3/Libdav1d.xcframework.zip",
            checksum: "d1a32ae6a1f0193e9f05c44c9176844af7f6d2a58cb33843f6f1b8dfd9224083"
        ),

        .binaryTarget(
            name: "Libavcodec",
            url: "https://github.com/mpvkit/MPVKit/releases/download/1.0.0/Libavcodec.xcframework.zip",
            checksum: "136e432919a8a7b5b80155c68e9dc91b0ef3ae6623970b87bb8bd96a452543cf"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/mpvkit/MPVKit/releases/download/1.0.0/Libavdevice.xcframework.zip",
            checksum: "65713615f53352b37baffb38c5b88d88bab647d050d999bcc4684344ab636bdf"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/mpvkit/MPVKit/releases/download/1.0.0/Libavformat.xcframework.zip",
            checksum: "2afb601375929640e743e7bdaa6c4a88e2b582a07e1c5f2dc95cc7f5b26a0810"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/mpvkit/MPVKit/releases/download/1.0.0/Libavfilter.xcframework.zip",
            checksum: "3e71af8633d99d365f14b88064bceafd57acb23fc64db90e55b715a9c0dca328"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/mpvkit/MPVKit/releases/download/1.0.0/Libavutil.xcframework.zip",
            checksum: "5dc251c8807c501982edfb0bc9bddfee4148733142d6ebb947738c60fb3bf8d8"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/mpvkit/MPVKit/releases/download/1.0.0/Libswresample.xcframework.zip",
            checksum: "d5c36acf2ff944e15706f4b7bfbf18bb1993ffc5b446c9f67f1aa79de5441f15"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/mpvkit/MPVKit/releases/download/1.0.0/Libswscale.xcframework.zip",
            checksum: "4fc00de6a7a8cddcdfe0eeb73b4f919cfaf9a0fd5a442f42a43e0f56e157d7c5"
        ),

        .binaryTarget(
            name: "Libuchardet",
            url: "https://github.com/mpvkit/libuchardet-build/releases/download/0.0.8/Libuchardet.xcframework.zip",
            checksum: "ea4f548a230a755e059144657cc9e2ff563c1cdeae03974c38f8b6e1a40303fb"
        ),

        .binaryTarget(
            name: "Libluajit",
            url: "https://github.com/mpvkit/libluajit-build/releases/download/2.1.0-fix/Libluajit.xcframework.zip",
            checksum: "3a171ef1627fb88260893dc452f989bd93dd8510814771ba3aff7753470d3f3e"
        ),

        .binaryTarget(
            name: "Libmpv",
            url: "https://github.com/mpvkit/MPVKit/releases/download/1.0.0/Libmpv.xcframework.zip",
            checksum: "c381ceb4c1504efac12da95293e56585bbeb691634aa64e3a729f517169933ba"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
