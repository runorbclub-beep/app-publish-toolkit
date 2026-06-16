#!/usr/bin/env python3
"""
应用元数据生成器
生成 App Store 和 Google Play 所需的应用描述、关键词等
"""

import json
import os

def generate_metadata():
    """生成交付物元数据"""
    
    metadata = {
        "app_name_zh": input("App 名称（中文）: ").strip(),
        "app_name_en": input("App 名称（英文）: ").strip(),
        "subtitle_zh": input("副标题（中文，30字内）: ").strip(),
        "subtitle_en": input("副标题（英文，30字内）: ").strip(),
        "short_desc_zh": input("简短描述（中文，80字内）: ").strip(),
        "short_desc_en": input("简短描述（英文，80字内）: ").strip(),
        "keywords_zh": input("关键词（中文，逗号分隔，100字内）: ").strip(),
        "keywords_en": input("关键词（英文，逗号分隔，100字内）: ").strip(),
        "category": input("分类（如 Sports, Health & Fitness）: ").strip(),
        "support_url": input("支持 URL: ").strip(),
        "privacy_url": input("隐私政策 URL: ").strip(),
        "copyright": input("版权信息: ").strip(),
    }
    
    # 生成详细描述
    print("\n--- 详细描述（中文，4000字内，输入空行结束）---")
    desc_zh_lines = []
    while True:
        line = input()
        if line == "":
            break
        desc_zh_lines.append(line)
    metadata["description_zh"] = "\n".join(desc_zh_lines)
    
    print("\n--- 详细描述（英文，4000字内，输入空行结束）---")
    desc_en_lines = []
    while True:
        line = input()
        if line == "":
            break
        desc_en_lines.append(line)
    metadata["description_en"] = "\n".join(desc_en_lines)
    
    # 保存
    output_dir = "metadata-output"
    os.makedirs(output_dir, exist_ok=True)
    
    # JSON
    with open(f"{output_dir}/metadata.json", "w", encoding="utf-8") as f:
        json.dump(metadata, f, ensure_ascii=False, indent=2)
    
    # App Store 格式
    with open(f"{output_dir}/appstore-zh.txt", "w", encoding="utf-8") as f:
        f.write(f"名称: {metadata['app_name_zh']}\n")
        f.write(f"副标题: {metadata['subtitle_zh']}\n")
        f.write(f"关键词: {metadata['keywords_zh']}\n\n")
        f.write(f"描述:\n{metadata['description_zh']}\n")
    
    with open(f"{output_dir}/appstore-en.txt", "w", encoding="utf-8") as f:
        f.write(f"Name: {metadata['app_name_en']}\n")
        f.write(f"Subtitle: {metadata['subtitle_en']}\n")
        f.write(f"Keywords: {metadata['keywords_en']}\n\n")
        f.write(f"Description:\n{metadata['description_en']}\n")
    
    # Google Play 格式
    with open(f"{output_dir}/playstore-zh.txt", "w", encoding="utf-8") as f:
        f.write(f"应用名称: {metadata['app_name_zh']}\n")
        f.write(f"简短描述: {metadata['short_desc_zh']}\n\n")
        f.write(f"完整描述:\n{metadata['description_zh']}\n")
    
    with open(f"{output_dir}/playstore-en.txt", "w", encoding="utf-8") as f:
        f.write(f"App name: {metadata['app_name_en']}\n")
        f.write(f"Short description: {metadata['short_desc_en']}\n\n")
        f.write(f"Full description:\n{metadata['description_en']}\n")
    
    print(f"\n✅ 元数据已生成到 {output_dir}/ 目录")
    print(f"  - metadata.json")
    print(f"  - appstore-zh.txt / appstore-en.txt")
    print(f"  - playstore-zh.txt / playstore-en.txt")

if __name__ == "__main__":
    generate_metadata()
