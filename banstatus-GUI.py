import tkinter as tk
from tkinter import messagebox, scrolledtext
import subprocess
import threading
import os

# Начальный список
current_file = ["lists/list-banned.txt"]
stop_flag = [False]
check_thread = [None]

def load_sites(filename):
    if not os.path.exists(filename):
        return []
    with open(filename, "r", encoding="utf-8") as file:
        return [line.strip() for line in file if line.strip()]

def toggle_file():
    if current_file[0] == "lists/list-banned.txt":
        current_file[0] = "lists/list-banned2.txt"
    elif current_file[0] == "lists/list-banned2.txt":
        current_file[0] = "lists/list-all.txt"
    else :
        current_file[0] = "lists/list-banned.txt"

    sites = load_sites(current_file[0])
    msg = f"Текущий список: {current_file[0]} — {len(sites)} сайтов"
    if len(sites) >= 1000 :
        results_text.insert(tk.END, msg + "\n", "info")
        results_text.insert(tk.END, "Внимание! Список содержит более 1000 сайтов. Это может замедлить процесс проверки.\n")
        results_text.see(tk.END)
    else:
        results_text.insert(tk.END, msg + "\n", "info")
        results_text.see(tk.END)

def stop_checking():
    stop_flag[0] = True
    results_text.insert(tk.END, "⏹ Проверка остановлена пользователем.\n", "warning")
    results_text.see(tk.END)

def update():
    tk.messagebox.showinfo(title="Обновление", message="Для проверки обновлений запустите update.bat")

def check_sites():
    results_text.delete(1.0, tk.END)
    sites = load_sites(current_file[0])
    if not sites:
        messagebox.showwarning("Файл не найден", f"Файл {current_file[0]} не найден или пуст.")
        return

    stop_flag[0] = False

    def ping_site(site):
        try:
            result = subprocess.run(
                ["ping", "-n", "1", site],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
                timeout=5
            )
            if result.returncode == 0:
                return "success", f"[✔] {site} — Доступен"
            else:
                return "fail", f"[✘] {site} — Недоступен"
        except Exception as e:
            return "error", f"[!] {site} — Ошибка: {e}"

    def run_check():
        count_success = 0
        count_fail = 0
        count_error = 0

        for site in sites:
            if stop_flag[0]:
                break

            tag_checking = f"checking_{site}"
            checking_text = f"[...] {site} — Проверка...\n"
            results_text.insert(tk.END, checking_text, tag_checking)
            results_text.see(tk.END)

            status, result_text = ping_site(site)

            if stop_flag[0]:
                break

            index_start = results_text.search(f"[...] {site}", "1.0", tk.END)
            if index_start:
                index_end = f"{index_start} lineend"
                results_text.delete(index_start, f"{index_end}\n")

            tag = {
                "success": "green",
                "fail": "red",
                "error": "orange"
            }.get(status, "orange")

            if status == "success":
                count_success += 1
            elif status == "fail":
                count_fail += 1
            else:
                count_error += 1

            results_text.insert(tk.END, result_text + "\n", tag)
            results_text.see(tk.END)

        if not stop_flag[0]:
            results_text.insert(tk.END, "\n--- Результаты проверки ---\n", "info")
            results_text.insert(tk.END, f"✅ Доступны: {count_success}\n", "green")
            results_text.insert(tk.END, f"❌ Недоступны: {count_fail}\n", "red")
            results_text.insert(tk.END, f"⚠ Ошибки: {count_error}\n", "orange")
            results_text.see(tk.END)


    # Запускаем в отдельном потоке
    check_thread[0] = threading.Thread(target=run_check)
    check_thread[0].start()

# GUI
window = tk.Tk()
window.title("BanStatus v2.0")
window.geometry("600x450")
window.resizable(False, False)

title_label = tk.Label(window, text="BanStatus", font=("Arial", 12))
title_label.pack(pady=10)

label = tk.Label(text="v2.0", font=("Arial", 7))
label.pack()

button_frame = tk.Frame(window)
button_frame.pack(pady=5)

check_button = tk.Button(button_frame, text="Запуск", command=check_sites, width=10)
check_button.grid(row=0, column=0, padx=5)

stop_button = tk.Button(button_frame, text="Остановить", command=stop_checking, width=10)
stop_button.grid(row=0, column=1, padx=5)

toggle_button = tk.Button(button_frame, text="Переключить список", command=toggle_file, width=20)
toggle_button.grid(row=0, column=2, padx=5)

toggle_button = tk.Button(button_frame, text="Проверить обновления", command=update, width=20)
toggle_button.grid(row=0, column=3, padx=5)

results_text = scrolledtext.ScrolledText(window, width=70, height=20, font=("Consolas", 10))
results_text.tag_config("green", foreground="green")
results_text.tag_config("red", foreground="red")
results_text.tag_config("orange", foreground="orange")
results_text.tag_config("info", foreground="blue")
results_text.tag_config("warning", foreground="darkorange")
results_text.pack(padx=10, pady=10)






window.mainloop()
