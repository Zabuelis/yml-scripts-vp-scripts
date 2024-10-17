from bs4 import BeautifulSoup
import os

def update_links(file_path, base_url):
    with open(file_path, 'r', encoding='utf-8') as file:
        soup = BeautifulSoup(file, 'lxml')

        # Update <a> tags
        for a in soup.find_all('a', href=True):
            href = a['href']
            if href.startswith('http://originalwebsite.com') or href.startswith('https://originalwebsite.com'):
                a['href'] = href.replace('http://originalwebsite.com', base_url).replace('https://originalwebsite.com', base_url)

        # Update <img> tags
        for img in soup.find_all('img', src=True):
            src = img['src']
            if src.startswith('http://originalwebsite.com') or src.startswith('https://originalwebsite.com'):
                img['src'] = src.replace('http://originalwebsite.com', base_url).replace('https://originalwebsite.com', base_url)

        # Update <link> tags (for CSS)
        for link in soup.find_all('link', href=True):
            href = link['href']
            if href.startswith('http://originalwebsite.com') or href.startswith('https://originalwebsite.com'):
                link['href'] = href.replace('http://originalwebsite.com', base_url).replace('https://originalwebsite.com', base_url)

        # Update <script> tags (for JS)
        for script in soup.find_all('script', src=True):
            src = script['src']
            if src.startswith('http://originalwebsite.com') or src.startswith('https://originalwebsite.com'):
                script['src'] = src.replace('http://originalwebsite.com', base_url).replace('https://originalwebsite.com', base_url)

    with open(file_path, 'w', encoding='utf-8') as file:
        file.write(str(soup))

def process_directory(directory, base_url):
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith('.html') or file.endswith('.htm'):
                file_path = os.path.join(root, file)
                update_links(file_path, base_url)

if __name__ == "__main__":
    directory = './sample-project/html'  # Path to the directory containing your HTML files
    base_url = '/'  # The base URL to replace with
    process_directory(directory, base_url)
