#!/usr/bin/env python3

import subprocess
import sys

ZIP_CODE_DEFAULT= "33603"
zip_code = ZIP_CODE_DEFAULT

#If we passed in a zip code, use it
if len(sys.argv) > 1:
    zip_code = sys.argv[1]

# Get the current weather
result = subprocess.run(["weather", zip_code], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

# Split into array and remove firs two lines
result = result.stdout.splitlines()
del result[0:2]

formated_str = " "
match = {"Temperature":"Temp",
         "Weather": "Wet",
         "Humidity": "Hum",
         "Sky conditions": "Sky",
         "Precipitation": "Prec"}

#Extract the data we want
for items in match:
  for lines in result:
    if items in lines:
      lines = lines.split(":")
      lines = lines[1].strip()
      formated_str += f'{lines}|'

#Save to file
with open("/var/weather", "w") as f:
    subprocess.run(["echo", formated_str[:-1]], stdout=f)

print(formated_str[:-1])


