#!/usr/bin/ruby -KuU
# encoding: utf-8

def cmu2ipa(entry, cmu)
  ipa = ""
  entry.each do |e|
    ipa << cmu[e]
  end
  ipa
end

cmu = {
  "EE" => "ˈɛ",
  "JJ" => "ɲ",
  "LL" => "ʎ",
  "OO" => "ˈɔ",
  "SS" => "ʃ",
  "a" => "a",
  "a1" => "ˈa",
  "b" => "b",
  "d" => "d",
  "dZZ" => "dʒ", # or "d͡ʒ"
  "dz" => "dz", # or "d͡z"
  "e" => "e",
  "e1" => "ˈe",
  "f" => "f",
  "g" => "ɡ",
  "i" => "i",
  "i1" => "ˈi",
  "j" => "j",
  "k" => "k",
  "l" => "l",
  "m" => "m",
  "n" => "n",
  "nf" => "nf", # questionable
  "ng" => "ŋ",
  "o" => "o",
  "o1" => "ˈo",
  "p" => "p",
  "r" => "r",
  "s" => "s",
  "t" => "t",
  "tSS" => "tʃ", # or "t͡ʃ"
  "ts" => "ts", # or "t͡s"
  "u" => "u",
  "u1" => "ˈu",
  "v" => "v",
  "w" => "w",
  "z" => "z"
}

dic = File.read("it.dic")

dic.each_line do |line|
  if line.match(/^. /) then next end
  entry = line.chomp.gsub(/\s+$/, "").split(" ")
  headword = entry[0]
  entry.shift
  ipa = cmu2ipa(entry, cmu)
  if entry.length > 1 && entry[1].match(/1|EE|OO/)
    ipa = "ˈ" + ipa.gsub(/ˈ/, "")
  end
  puts headword + "\t/" + ipa + "/"
end

