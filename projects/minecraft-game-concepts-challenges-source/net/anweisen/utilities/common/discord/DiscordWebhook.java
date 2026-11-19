package net.anweisen.utilities.common.discord;

import java.awt.Color;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.function.Function;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.net.ssl.HttpsURLConnection;
import net.anweisen.utilities.common.config.Document;

public class DiscordWebhook {
   protected String url;
   protected String content;
   protected String username;
   protected String avatarUrl;
   protected boolean tts;
   protected List embeds = new ArrayList();

   private DiscordWebhook() {
   }

   public DiscordWebhook(@Nonnull String url) {
      this.url = url;
   }

   public DiscordWebhook(@Nonnull String url, @Nonnull String username) {
      this.url = url;
      this.username = username;
   }

   public DiscordWebhook(@Nonnull String url, @Nonnull String username, @Nonnull String avatarUrl) {
      this.url = url;
      this.username = username;
      this.avatarUrl = avatarUrl;
   }

   public DiscordWebhook(@Nonnull String url, @Nonnull String username, @Nonnull String avatarUrl, @Nonnull String content, @Nonnull List embeds, boolean tts) {
      this.url = url;
      this.username = username;
      this.avatarUrl = avatarUrl;
      this.content = content;
      this.embeds = embeds;
      this.tts = tts;
   }

   @Nonnull
   public DiscordWebhook setUrl(@Nonnull String url) {
      this.url = url;
      return this;
   }

   @Nonnull
   public DiscordWebhook setContent(@Nullable String content) {
      this.content = content;
      return this;
   }

   @Nonnull
   public DiscordWebhook setUsername(@Nullable String username) {
      this.username = username;
      return this;
   }

   @Nonnull
   public DiscordWebhook setAvatarUrl(@Nullable String avatarUrl) {
      this.avatarUrl = avatarUrl;
      return this;
   }

   @Nonnull
   public DiscordWebhook setTts(boolean tts) {
      this.tts = tts;
      return this;
   }

   @Nonnull
   public DiscordWebhook addEmbed(DiscordWebhook.EmbedObject embed) {
      this.embeds.add(embed);
      return this;
   }

   public void execute() throws IOException {
      if (this.content == null && this.embeds.isEmpty()) {
         throw new IllegalArgumentException("Set content or add at least one EmbedObject");
      } else {
         Document json = Document.create();
         json.set("content", this.content);
         json.set("username", this.username);
         json.set("avatar_url", this.avatarUrl);
         json.set("tts", this.tts);
         if (!this.embeds.isEmpty()) {
            List embedObjects = new ArrayList();
            Iterator var3 = this.embeds.iterator();

            while(var3.hasNext()) {
               DiscordWebhook.EmbedObject embed = (DiscordWebhook.EmbedObject)var3.next();
               Document jsonEmbed = Document.create();
               jsonEmbed.set("title", embed.getTitle());
               jsonEmbed.set("description", embed.getDescription());
               jsonEmbed.set("url", embed.getUrl());
               if (embed.getColor() != null) {
                  Color color = embed.getColor();
                  int rgb = color.getRed();
                  rgb = (rgb << 8) + color.getGreen();
                  rgb = (rgb << 8) + color.getBlue();
                  jsonEmbed.set("color", rgb);
               }

               DiscordWebhook.EmbedObject.Footer footer = embed.getFooter();
               DiscordWebhook.EmbedObject.Image image = embed.getImage();
               DiscordWebhook.EmbedObject.Thumbnail thumbnail = embed.getThumbnail();
               DiscordWebhook.EmbedObject.Author author = embed.getAuthor();
               List fields = embed.getFields();
               Document jsonAuthor;
               if (footer != null) {
                  jsonAuthor = Document.create();
                  jsonAuthor.set("text", footer.getText());
                  jsonAuthor.set("icon_url", footer.getIconUrl());
                  jsonEmbed.set("footer", jsonAuthor);
               }

               if (image != null) {
                  jsonAuthor = Document.create();
                  jsonAuthor.set("url", image.getUrl());
                  jsonEmbed.set("image", jsonAuthor);
               }

               if (thumbnail != null) {
                  jsonAuthor = Document.create();
                  jsonAuthor.set("url", thumbnail.getUrl());
                  jsonEmbed.set("thumbnail", jsonAuthor);
               }

               if (author != null) {
                  jsonAuthor = Document.create();
                  jsonAuthor.set("name", author.getName());
                  jsonAuthor.set("url", author.getUrl());
                  jsonAuthor.set("icon_url", author.getIconUrl());
                  jsonEmbed.set("author", jsonAuthor);
               }

               List jsonFields = new ArrayList();
               Iterator var12 = fields.iterator();

               while(var12.hasNext()) {
                  DiscordWebhook.EmbedObject.Field field = (DiscordWebhook.EmbedObject.Field)var12.next();
                  Document jsonField = Document.create();
                  jsonField.set("name", field.getName());
                  jsonField.set("value", field.getValue());
                  jsonField.set("inline", field.isInline());
                  jsonFields.add(jsonField);
               }

               jsonEmbed.set("fields", jsonFields.toArray());
               embedObjects.add(jsonEmbed);
            }

            json.set("embeds", embedObjects.toArray());
         }

         URL url = new URL(this.url);
         HttpsURLConnection connection = (HttpsURLConnection)url.openConnection();
         connection.setRequestMethod("POST");
         connection.setDoOutput(true);
         connection.setDoInput(true);
         connection.setConnectTimeout(2500);
         connection.setReadTimeout(1000);
         connection.setRequestProperty("User-Agent", "Mozilla/5.0");
         connection.setRequestProperty("Accept", "*/*");
         connection.setRequestProperty("Content-Type", "application/json");
         OutputStream output = connection.getOutputStream();
         output.write(json.toString().getBytes(StandardCharsets.UTF_8));
         output.flush();
         output.close();
         connection.getInputStream().close();
         connection.disconnect();
      }
   }

   @Nonnull
   public DiscordWebhook replaceEverywhere(@Nonnull String trigger, @Nonnull String replacement) {
      if (this.content != null) {
         this.content = this.content.replace(trigger, replacement);
      }

      if (this.username != null) {
         this.username = this.username.replace(trigger, replacement);
      }

      Iterator var3 = this.embeds.iterator();

      while(var3.hasNext()) {
         DiscordWebhook.EmbedObject embed = (DiscordWebhook.EmbedObject)var3.next();
         if (embed.author.name != null) {
            embed.author.name = embed.author.name.replace(trigger, replacement);
         }

         if (embed.description != null) {
            embed.description = embed.description.replace(trigger, replacement);
         }

         if (embed.title != null) {
            embed.title = embed.title.replace(trigger, replacement);
         }

         if (embed.footer.text != null) {
            embed.footer.text = embed.footer.text.replace(trigger, replacement);
         }

         Iterator var5 = embed.fields.iterator();

         while(var5.hasNext()) {
            DiscordWebhook.EmbedObject.Field field = (DiscordWebhook.EmbedObject.Field)var5.next();
            if (field.name != null) {
               field.name = field.name.replace(trigger, replacement);
            }

            if (field.value != null) {
               field.value = field.value.replace(trigger, replacement);
            }
         }
      }

      return this;
   }

   public DiscordWebhook clone() {
      return new DiscordWebhook(this.url, this.username, this.avatarUrl, this.content, clone(this.embeds, DiscordWebhook.EmbedObject::clone), this.tts);
   }

   @Nonnull
   protected static List clone(@Nonnull Collection collection, @Nonnull Function cloner) {
      List list = new ArrayList(collection.size());
      Iterator var3 = collection.iterator();

      while(var3.hasNext()) {
         Object current = var3.next();
         list.add(cloner.apply(current));
      }

      return list;
   }

   public static class EmbedObject {
      protected String title;
      protected String description;
      protected String url;
      protected Color color;
      protected DiscordWebhook.EmbedObject.Footer footer;
      protected DiscordWebhook.EmbedObject.Thumbnail thumbnail;
      protected DiscordWebhook.EmbedObject.Image image;
      protected DiscordWebhook.EmbedObject.Author author;
      protected List fields = new ArrayList();

      public EmbedObject() {
      }

      public EmbedObject(@Nullable String title, @Nullable String description, @Nullable String url, @Nullable Color color, @Nullable DiscordWebhook.EmbedObject.Footer footer, @Nullable DiscordWebhook.EmbedObject.Thumbnail thumbnail, @Nullable DiscordWebhook.EmbedObject.Image image, @Nullable DiscordWebhook.EmbedObject.Author author, @Nonnull List fields) {
         this.title = title;
         this.description = description;
         this.url = url;
         this.color = color;
         this.footer = footer;
         this.thumbnail = thumbnail;
         this.image = image;
         this.author = author;
         this.fields = fields;
      }

      public String getTitle() {
         return this.title;
      }

      public String getDescription() {
         return this.description;
      }

      public String getUrl() {
         return this.url;
      }

      public Color getColor() {
         return this.color;
      }

      public DiscordWebhook.EmbedObject.Footer getFooter() {
         return this.footer;
      }

      public DiscordWebhook.EmbedObject.Thumbnail getThumbnail() {
         return this.thumbnail;
      }

      public DiscordWebhook.EmbedObject.Image getImage() {
         return this.image;
      }

      public DiscordWebhook.EmbedObject.Author getAuthor() {
         return this.author;
      }

      public List getFields() {
         return this.fields;
      }

      @Nonnull
      public DiscordWebhook.EmbedObject setTitle(String title) {
         this.title = title;
         return this;
      }

      @Nonnull
      public DiscordWebhook.EmbedObject setDescription(String description) {
         this.description = description;
         return this;
      }

      @Nonnull
      public DiscordWebhook.EmbedObject setUrl(String url) {
         this.url = url;
         return this;
      }

      @Nonnull
      public DiscordWebhook.EmbedObject setColor(Color color) {
         this.color = color;
         return this;
      }

      @Nonnull
      public DiscordWebhook.EmbedObject setFooter(String text, String icon) {
         this.footer = new DiscordWebhook.EmbedObject.Footer(text, icon);
         return this;
      }

      @Nonnull
      public DiscordWebhook.EmbedObject setThumbnail(String url) {
         this.thumbnail = new DiscordWebhook.EmbedObject.Thumbnail(url);
         return this;
      }

      @Nonnull
      public DiscordWebhook.EmbedObject setImage(String url) {
         this.image = new DiscordWebhook.EmbedObject.Image(url);
         return this;
      }

      @Nonnull
      public DiscordWebhook.EmbedObject setAuthor(String name, String url, String icon) {
         this.author = new DiscordWebhook.EmbedObject.Author(name, url, icon);
         return this;
      }

      @Nonnull
      public DiscordWebhook.EmbedObject addField(String name, String value, boolean inline) {
         this.fields.add(new DiscordWebhook.EmbedObject.Field(name, value, inline));
         return this;
      }

      public DiscordWebhook.EmbedObject clone() {
         return new DiscordWebhook.EmbedObject(this.title, this.description, this.url, this.color, this.footer == null ? null : this.footer.clone(), this.thumbnail == null ? null : this.thumbnail.clone(), this.image == null ? null : this.image.clone(), this.author == null ? null : this.author.clone(), DiscordWebhook.clone(this.fields, DiscordWebhook.EmbedObject.Field::clone));
      }

      public static class Field {
         private String name;
         private String value;
         private boolean inline;

         private Field() {
         }

         private Field(String name, String value, boolean inline) {
            this.name = name;
            this.value = value;
            this.inline = inline;
         }

         private String getName() {
            return this.name;
         }

         private String getValue() {
            return this.value;
         }

         private boolean isInline() {
            return this.inline;
         }

         protected DiscordWebhook.EmbedObject.Field clone() {
            return new DiscordWebhook.EmbedObject.Field(this.name, this.value, this.inline);
         }

         // $FF: synthetic method
         Field(String x0, String x1, boolean x2, Object x3) {
            this(x0, x1, x2);
         }
      }

      public static class Author {
         private String name;
         private String url;
         private String iconUrl;

         private Author() {
         }

         public Author(String name, String url, String iconUrl) {
            this.name = name;
            this.url = url;
            this.iconUrl = iconUrl;
         }

         private String getName() {
            return this.name;
         }

         private String getUrl() {
            return this.url;
         }

         private String getIconUrl() {
            return this.iconUrl;
         }

         protected DiscordWebhook.EmbedObject.Author clone() {
            return new DiscordWebhook.EmbedObject.Author(this.name, this.url, this.iconUrl);
         }
      }

      public static class Image {
         private String url;

         private Image() {
         }

         public Image(String url) {
            this.url = url;
         }

         private String getUrl() {
            return this.url;
         }

         public DiscordWebhook.EmbedObject.Image clone() {
            return new DiscordWebhook.EmbedObject.Image(this.url);
         }
      }

      public static class Thumbnail {
         private String url;

         private Thumbnail() {
         }

         public Thumbnail(String url) {
            this.url = url;
         }

         private String getUrl() {
            return this.url;
         }

         protected DiscordWebhook.EmbedObject.Thumbnail clone() {
            return new DiscordWebhook.EmbedObject.Thumbnail(this.url);
         }
      }

      public static class Footer {
         protected String text;
         protected String iconUrl;

         private Footer() {
         }

         public Footer(String text, String iconUrl) {
            this.text = text;
            this.iconUrl = iconUrl;
         }

         private String getText() {
            return this.text;
         }

         private String getIconUrl() {
            return this.iconUrl;
         }

         protected DiscordWebhook.EmbedObject.Footer clone() {
            return new DiscordWebhook.EmbedObject.Footer(this.text, this.iconUrl);
         }
      }
   }
}
