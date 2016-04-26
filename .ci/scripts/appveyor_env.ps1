# This file is part of HDL Code Checker.

# HDL Code Checker is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# HDL Code Checker is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with HDL Code Checker.  If not, see <http://www.gnu.org/licenses/>.

write-host "Creating AppVeyor-like environment variables"

$env:CI_WORK_PATH="$env:USERPROFILE\\ci"

if ($env:APPVEYOR -ne "True") {
    $env:APPVEYOR_BUILD_FOLDER=$(get-location)
    $env:PATH="C:\Program Files\7-zip;$env:PATH"
}

if ($env:BUILDER_NAME -eq "msim") {
    $env:BUILDER_PATH="$env:CI_WORK_PATH\\modelsim_ase\\win32aloem"
} elseif ($env:BUILDER_NAME -eq "ghdl") {
    $env:INSTALL_DIR="$env:CI_WORK_PATH\\ghdl-0.31-mcode-win32"
    $env:BUILDER_PATH="$env:INSTALL_DIR\\bin"
}

$env:CACHE_PATH="$env:CI_WORK_PATH\\cache"
$env:HDLCC_CI="$env:CI_WORK_PATH\\hdlcc_ci"
$env:ARCH="32"

if (!(Test-Path "$env:CI_WORK_PATH")) {
    cmd /c "mkdir `"$env:CI_WORK_PATH`""
}

if (!(Test-Path "$env:CACHE_PATH")) {
    cmd /c "mkdir `"$env:CACHE_PATH`""
}

"CACHE_PATH             $env:CACHE_PATH"
"HDLCC_CI               $env:HDLCC_CI"
"ARCH                   $env:ARCH"
"CI_WORK_PATH           $env:CI_WORK_PATH"
"APPVEYOR               $env:APPVEYOR"
"APPVEYOR_BUILD_FOLDER  $env:APPVEYOR_BUILD_FOLDER"
"PATH                   $env:PATH"
"BUILDER_NAME           $env:BUILDER_NAME"
"CACHE_PATH             $env:CACHE_PATH"
"INSTALL_DIR            $env:INSTALL_DIR"