#!/usr/bin/env ruby
require 'otx_ruby'
require 'colorize'

#Settings
$api_alienvault = ""
$ignore_keywords = ["Python3", "Delphi"]

#Fetch AlienVault OTX Intelligence.
def search_apt(domain)
    #API Connection
    begin
        otx = OTX::Domain.new($api_alienvault)
    rescue => exception
        puts "❌  ERROR trying to connect to AlienVault Server: #{exception}".light_red
    end
    #Fetch tags
    adversaries = Hash.new(0)
    malware = Hash.new(0)
    begin
        otx_domain = otx.get_general(domain)
        otx_domain.pulse_info.pulses.each do | pulse |
            if !pulse.adversary.empty?
                adversaries[pulse.adversary] += 1
            end
            if pulse.malware_families.count != 0
                pulse.malware_families.each do | mal |
                    malware[mal['display_name']] += 1 unless $ignore_keywords.include? mal['display_name']
                end
            end
        end
    show_report(domain, adversaries, malware)
    rescue => exception
        puts "[!] ERROR: #{exception}"
    end
end

#Show Report
def show_report(domain, adversaries, malware)
    if adversaries.count == 0 && malware.count == 0
        puts "ℹ️  Report for #{domain}: No malicious activity found.".light_blue
    else
        puts "⚠️  Report for #{domain}: Malicious activity found."
        if adversaries.count > 0 
            puts "🥷🏻  Domain is linked to known adversaries:"
            adversaries.each do |k, v|
                puts "\t* #{k} (1)"
            end
        end
        if malware.count > 0 
            puts "☣️  Domain is linked to malware activity:"
            malware.each do |k, v|
                puts "\t* #{k} (1)"
            end
        end
    end
    sleep 3
end

def main()
    if ARGV.length < 1
        puts "ℹ️  Usage: biochip.rb [DOMAIN]".light_blue
        exit 1
    else
        search_apt(ARGV[0])
    end
end

main()