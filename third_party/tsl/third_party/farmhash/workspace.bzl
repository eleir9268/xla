"""Provides the repository macro to import farmhash."""

load("//third_party:repo.bzl", "tf_http_archive", "tf_mirror_urls")

def repo():
    """Imports farmhash."""

    # Attention: tools parse and update these lines.
    # LINT.IfChange
    FARMHASH_COMMIT = "be24c1508eacdf25691bcf561b6f443d6e3ed141"
    FARMHASH_SHA256 = "965aa1fa293fd1d934305d2c4fd6472f817a55f33f66ae5ed300496d8845d452"
    # LINT.ThenChange(//tensorflow/lite/tools/cmake/modules/farmhash.cmake)

    tf_http_archive(
        name = "farmhash_archive",
        build_file = "//third_party/farmhash:farmhash.BUILD",
        sha256 = FARMHASH_SHA256,
        strip_prefix = "farmhash-{commit}".format(commit = FARMHASH_COMMIT),
        urls = tf_mirror_urls("https://github.com/qnx-ports/farmhash/archive/{commit}.tar.gz".format(commit = FARMHASH_COMMIT)),
    )

    tf_http_archive(
        name = "farmhash_gpu_archive",
        build_file = "//third_party/farmhash:farmhash_gpu.BUILD",
        patch_file = ["//third_party/farmhash:farmhash_support_cuda.patch"],
        sha256 = FARMHASH_SHA256,
        strip_prefix = "farmhash-{commit}".format(commit = FARMHASH_COMMIT),
        urls = tf_mirror_urls("https://github.com/qnx-ports/farmhash/archive/{commit}.tar.gz".format(commit = FARMHASH_COMMIT)),
    )
