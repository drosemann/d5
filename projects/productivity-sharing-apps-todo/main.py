import tkinter as tk
from tkinter import messagebox
import pickle

class ToDoApp:
    def __init__(self, root):
        # Initialisiere das Hauptfenster
        self.root = root
        self.root.title("ToDo Liste")

        # Eingabefeld für neue Aufgaben
        self.entry = tk.Entry(root, width=50)
        self.entry.pack(pady=10)

        # Button zum Hinzufügen von Aufgaben
        self.add_button = tk.Button(root, text="Aufgabe hinzufügen", command=self.add_task)
        self.add_button.pack(pady=5)

        # Listbox zur Anzeige der Aufgaben
        self.listbox = tk.Listbox(root, width=50, height=10)
        self.listbox.pack(pady=10)

        # Button zum Löschen von Aufgaben
        self.delete_button = tk.Button(root, text="Aufgabe löschen", command=self.delete_task)
        self.delete_button.pack(pady=5)

        # Button zum Speichern der Aufgaben
        self.save_button = tk.Button(root, text="Aufgaben speichern", command=self.save_tasks)
        self.save_button.pack(pady=5)

        # Button zum Markieren von Aufgaben als erledigt
        self.done_button = tk.Button(root, text="Aufgabe erledigt", command=self.mark_task_done)
        self.done_button.pack(pady=5)

        # Button zum Bearbeiten von Aufgaben
        self.edit_button = tk.Button(root, text="Aufgabe bearbeiten", command=self.edit_task)
        self.edit_button.pack(pady=5)

        # Dropdown-Menü für Priorität
        self.priority_var = tk.StringVar(value="Normal")
        self.priority_menu = tk.OptionMenu(root, self.priority_var, "Hoch", "Normal", "Niedrig")
        self.priority_menu.pack(pady=5)

        # Lade gespeicherte Aufgaben beim Start
        self.load_tasks()

    def add_task(self):
        # Füge eine neue Aufgabe hinzu
        task = self.entry.get()
        priority = self.priority_var.get()
        if task:
            self.listbox.insert(tk.END, f"{priority}: {task}")
            self.entry.delete(0, tk.END)
        else:
            messagebox.showwarning("Warnung", "Bitte eine Aufgabe eingeben.")

    def delete_task(self):
        # Lösche die ausgewählte Aufgabe
        try:
            selected_task_index = self.listbox.curselection()[0]
            self.listbox.delete(selected_task_index)
        except IndexError:
            messagebox.showwarning("Warnung", "Bitte eine Aufgabe auswählen.")

    def save_tasks(self):
        # Speichere die Aufgaben in einer Datei
        with open("tasks.pkl", "wb") as f:
            pickle.dump(self.listbox.get(0, tk.END), f)

    def load_tasks(self):
        # Lade die Aufgaben aus einer Datei
        try:
            with open("tasks.pkl", "rb") as f:
                tasks = pickle.load(f)
                for task in tasks:
                    self.listbox.insert(tk.END, task)
        except FileNotFoundError:
            pass

    def mark_task_done(self):
        # Markiere die ausgewählte Aufgabe als erledigt
        try:
            selected_task_index = self.listbox.curselection()[0]
            self.listbox.itemconfig(selected_task_index, {'bg':'lightgreen'})
        except IndexError:
            messagebox.showwarning("Warnung", "Bitte eine Aufgabe auswählen.")

    def edit_task(self):
        # Bearbeite die ausgewählte Aufgabe
        try:
            selected_task_index = self.listbox.curselection()[0]
            new_task = self.entry.get()
            if new_task:
                self.listbox.delete(selected_task_index)
                self.listbox.insert(selected_task_index, new_task)
                self.entry.delete(0, tk.END)
            else:
                messagebox.showwarning("Warnung", "Bitte eine Aufgabe eingeben.")
        except IndexError:
            messagebox.showwarning("Warnung", "Bitte eine Aufgabe auswählen.")

if __name__ == "__main__":
    # Starte die Anwendung
    root = tk.Tk()
    app = ToDoApp(root)
    root.mainloop()
