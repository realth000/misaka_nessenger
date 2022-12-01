package core

import (
	"MisakaNessengerServer/common"
	"os"
)

var (
	envTmpDirOldValue = "" // Save the old value, prepare to reset
)

const (
	// FIXME: Do not hardcode here.
	androidTmpDirEnvValue = "/data/data/kzs.th000.misaka_nessenger/cache"
)

// SetAndroidTmpDirEnv set some environments that used on Android.
func SetAndroidTmpDirEnv(oldEnvValue string) {
	envTmpDirOldValue = oldEnvValue
	// Default value of env common.AndroidTmpDirEnvName is "/data/local/tmp/" on Android,
	//   * see https://cs.opensource.google/go/go/+/refs/tags/go1.19.3:src/os/file_unix.go;l=332)
	// which is inaccessible without root privilege,
	// so we should set it to package's file dir.
	_ = os.Setenv(common.AndroidTmpDirEnvName, androidTmpDirEnvValue)
}

// ResetAndroidTmpDirEnv reset the value of common.AndroidTmpDirEnvName to envTmpDirOldValue.
func ResetAndroidTmpDirEnv() {
	if envTmpDirOldValue != "" {
		_ = os.Setenv(common.AndroidTmpDirEnvName, envTmpDirOldValue)
		envTmpDirOldValue = ""
	} else {
		_ = os.Unsetenv(common.AndroidTmpDirEnvName)
	}
}
