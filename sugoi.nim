# Copyright 2016 Yoshihiro Tanaka
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

  # http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Author: Yoshihiro Tanaka <contact@cordea.jp>
# date  :2016-03-31

import parseopt2
import threadpool

{.experimental.}

proc sugoi(sugoiString: string) =
    echo sugoiString

proc sugokunai(sugoiString: string)  =
    parallel:
        while true:
            spawn sugoi(sugoiString)

proc handleControlC() {.noconv.} =
    echo "すごかった！"
    quit 0

when isMainModule:
    var sugoiString = "すごい！"
    setControlCHook handleControlC
    for kind, key, _ in getopt():
        case kind
        of cmdShortOption:
            case key
            of "n":
                sugoiString = "すごくない！"
            else: discard
        else: discard

    sugokunai(sugoiString)
