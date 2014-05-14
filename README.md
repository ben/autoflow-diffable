# Autoflow-diffable package

Reformats paragraphs so that each line contains one sentence, which is optimal for diffing.

For example, this text:

```text
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc hendrerit placerat nisl eget feugiat. Suspendisse laoreet ut velit et semper. Praesent posuere quis arcu sit amet sollicitudin. Morbi scelerisque volutpat dolor id suscipit. Aenean a quam nunc. Aliquam erat volutpat. Maecenas in nisi id dui porttitor sagittis a sit amet mi. Quisque eleifend convallis nulla eu porttitor. Integer tortor nunc, convallis non consectetur at, tincidunt non mi. Praesent nec lacus in ipsum molestie rhoncus sed eget mauris. Duis convallis leo quis libero gravida, id tempor magna pulvinar. Suspendisse vitae tellus convallis, dignissim nibh nec, tincidunt risus. Donec pharetra pharetra arcu at dictum. Integer commodo semper nulla, ut venenatis quam. Mauris mattis, est a vehicula consectetur, felis risus tristique libero, vestibulum porttitor turpis leo sed felis. Aliquam erat volutpat.
```

Is transformed into this:

```text
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Nunc hendrerit placerat nisl eget feugiat.
Suspendisse laoreet ut velit et semper.
Praesent posuere quis arcu sit amet sollicitudin.
Morbi scelerisque volutpat dolor id suscipit.
Aenean a quam nunc.
Aliquam erat volutpat.
Maecenas in nisi id dui porttitor sagittis a sit amet mi.
Quisque eleifend convallis nulla eu porttitor.
Integer tortor nunc, convallis non consectetur at, tincidunt non mi.
Praesent nec lacus in ipsum molestie rhoncus sed eget mauris.
Duis convallis leo quis libero gravida, id tempor magna pulvinar.
Suspendisse vitae tellus convallis, dignissim nibh nec, tincidunt risus.
Donec pharetra pharetra arcu at dictum.
Integer commodo semper nulla, ut venenatis quam.
Mauris mattis, est a vehicula consectetur, felis risus tristique libero, vestibulum porttitor turpis leo sed felis.
Aliquam erat volutpat.
```

The default hotkey is `ctrl-cmd-q`.
