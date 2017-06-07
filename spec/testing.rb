require_relative '../components/pages'
require_relative '../lib/data'

visit ''

find_by_id('ac-globalnav').find('.ac-gn-link-support').click

search_text = find($support_page_selectors[:search_text])

search_text.set 'ipod'
search_text.native.send_keys :return

item = find('.SearchResults').find('.SearchResult', match: :first)

p item.text
