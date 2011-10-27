(in-package :freetype2)

 ;; Basic Types

(defcwraptype ft-pointer :pointer)

(defcwrap ft-vector
    ((x ft-pos)
     (y ft-pos)))

(defcwrap ft-bbox
    ((xmin ft-pos)
     (ymin ft-pos)
     (xmax ft-pos)
     (ymax ft-pos)))

(defcwrap ft-matrix
    ((xx ft-fixed)
     (xy ft-fixed)
     (yx ft-fixed)
     (yy ft-fixed)))

(defcwrap ft-unitvector
    ((x ft-f2dot14)
     (y ft-f2dot14)))

(defcwrap ft-bitmap
    ((rows :int)
     (width :int)
     (pitch :int)
     (buffer :pointer)
     (num-grays :short)
     (pixel-mode :char)
     (palette-mode :char)
     (palette :pointer)))

(defcwrap ft-data
    ((pointer :pointer)
     (length ft-int)))

(defcwraptype ft-generic-finalizer :pointer)

(defcwrap ft-generic
    ((data :pointer)
     (finalizer ft-generic-finalizer)))

 ;; System Interface
(defcwraptype ft-memory :pointer)
(defcwraptype ft-alloc-func :pointer)
(defcwraptype ft-free-func :pointer)
(defcwraptype ft-realloc-func :pointer)

(defcwrap (ft-memoryrec ft-memory)
    ((user :pointer)
     (alloc ft-alloc-func)
     (free ft-free-func)
     (realloc ft-realloc-func)))

(defcwraptype ft-stream :pointer)

(defcwrap ft-streamdesc
    ((value :long)
     (pointer :pointer)))

(defcwraptype ft-stream-iofunc :pointer)
(defcwraptype ft-stream-closefunc :pointer)

(defcwrap (ft-streamrec ft-stream)
    ((base :pointer)
     (size :unsigned-long)
     (pos :unsigned-long)
     (descriptor ft-streamdesc)
     (pathname ft-streamdesc)
     (read ft-stream-iofunc)
     (close ft-stream-closefunc)
     (memory ft-memory)
     (cursor :pointer)
     (limit :pointer)))

 ;; List Processing
(defcwraptype ft-list :pointer)
(defcwraptype ft-listnode :pointer)

(defcwrap (ft-listrec ft-list)
    ((head ft-listnode)
     (tail ft-listnode)))

(defcwrap (ft-listnoderec ft-listnode)
    ((prev ft-listnode)
     (next ft-listnode)
     (data :pointer)))

(defcwraptype ft-list-iterator :pointer)
(defcwraptype ft-list-destructor :pointer)

 ;; Outline Processing

(defcwrap ft-outline
    ((n-contours :short)
     (n-points :short)
     (points :pointer)
     (tags :pointer)
     (contours :pointer)
     (flags :int)))

 ;; Basic API
(defcwraptype ft-library :pointer)
(defcwraptype ft-face :pointer)
(defcwraptype ft-size :pointer)
(defcwraptype ft-glyphslot :pointer)
(defcwraptype ft-charmap :pointer)
(defcwraptype ft-module :pointer)
(defcwraptype ft-driver :pointer)
(defcwraptype ft-renderer :pointer)
(defcwraptype ft-face-internal :pointer)
(defcwraptype ft-size-internal :pointer)
(defcwraptype ft-subglyph :pointer)
(defcwraptype ft-slot-internal :pointer)
(defcwraptype ft-size-request :pointer)

(defcwrap ft-glyph-metrics
    ((width ft-pos)
     (height ft-pos)
     (hori-bearing-x ft-pos)
     (hori-bearing-y ft-pos)
     (hori-advance ft-pos)
     (vert-bearing-x ft-pos)
     (vert-bearing-y ft-pos)
     (vert-advance ft-pos)))

(defcwrap ft-bitmap-size
    ((height ft-short)
     (width ft-short)
     (size ft-pos)
     (x-ppem ft-pos)
     (y-ppem ft-pos)))

(defcwrap (ft-charmaprec ft-charmap)
    ((face ft-face)
     (encoding ft-encoding)
     (platform-id ft-ushort)
     (encoding-id ft-ushort)))

(defcwrap (ft-facerec ft-face)
    ((num-faces ft-long)
     (face-index ft-long)
     
     (face-flags ft-long)
     (style-flags ft-long)
     
     (num-glyphs ft-long)
     
     (family-name :string)
     (style-name :string)
     
     (num-fixed-sizes ft-int)
     (available-sizes (pointer-to :type ft-bitmap-size
                                  :array-size num-fixed-sizes))
     (num-charmaps ft-int)
     (charmaps (pointer-to :type ft-charmap
                           :array-size num-charmaps))
     (generic ft-generic)
     (bbox ft-bbox)
     (units-per-em ft-ushort)
     (ascender ft-short)
     (descender ft-short)
     (height ft-short)
     (max-advance-width ft-short)
     (max-advance-height ft-short)
     (underline-position ft-short)
     (underline-thickness ft-short)
     (glyph ft-glyphslot)
     (size ft-size)
     (charmap ft-charmap)
     (driver ft-driver)
     (memory ft-memory)
     (stream ft-stream)
     (sizes-list ft-listrec)
     (autohint ft-generic)
     (extensions :pointer)
     (internal ft-face-internal)))

(defcwrap ft-size-metrics
    ((x-ppem ft-ushort)
     (y-ppem ft-ushort)
     (x-scale ft-fixed)
     (y-scale ft-fixed)
     (ascender ft-pos)
     (descender ft-pos)
     (height ft-pos)
     (max-advance ft-pos)))

(defcwrap (ft-sizerec ft-size)
    ((face ft-face)
     (generic ft-generic)
     (metrics ft-size-metrics)
     (internal ft-size-internal)))

(defcwrap (ft-glyphslotrec ft-glyphslot)
    ((library ft-library)
     (face ft-face)
     (next ft-glyphslot)
     (reserved ft-uint)
     (generic ft-generic)
     (metrics ft-glyph-metrics)
     (linear-hori-advance ft-fixed)
     (linear-vert-advance ft-fixed)
     (advance ft-vector)
     (format ft-glyph-format)
     (bitmap ft-bitmap)
     (bitmap-left ft-int)
     (bitmap-top ft-int)
     (outline ft-outline)
     (num-subglyphs ft-uint)
     (subglyphs ft-subglyph)
     (control-data :pointer)
     (control-len :long)
     (lsb-delta ft-pos)
     (rsb-delta ft-pos)
     (other :pointer)
     (internal ft-face-internal)))

(defcwrap ft-parameter
    ((tag ft-ulong)
     (data ft-pointer)))

(defcwrap ft-open-args
    ((flags ft-uint)
     (memory-base :pointer)
     (memory-size ft-long)
     (pathname :pointer)
     (stream ft-stream)
     (driver ft-module)
     (num-params ft-int)
     (params ft-parameter)))

(defcwrap (ft-size-requestrec ft-size-request)
    ((type ft-size-request-type)
     (width ft-long)
     (height ft-long)
     (hori-resolution ft-uint)
     (vert-resolution ft-uint)))

 ;; Bit fields

(defbitfield ft-load-flags
  (:default 0)
  :no-scale :no-hinting :render :no-bitmap :vertical-layout :force-autohint
  :crop-bitmap :pedantic :ignore-global-advance-width :no-recurse
  :ignore-transform :monochrome :linear-design :no-autohint)
